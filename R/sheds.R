## Functions to ID and handle shed tags in the detection histories
##' Identify a shed tag
##'
##' This function identifies a shed tag, or a large gap in a fish
##' history, according to if a tag was detected at a single station
##' for 7 continuous days, without a break in the detections for more
##' than one hour.
##'
##' The \code{tag_tales()} function defaults to lumping all detections
##' with no more than 1 hour between detections into a single stay. By
##' default, the shed tag can only be at the last detected station (as
##' the tag should not be moving once shed). 
##'  
##' @title Identify Shed tags
##' @param df data.frame of detection histories created by \code{tag_tales()}. 
##' @param id_column character, the name of the TagID column
##' @param ... additional args passed to id_one_shed
##' @return data.frame, with TagID, shed (logical), and long_gap
##'     (logical)
##' @author Matt Espe
##' @export
identify_sheds = function(df, id_column = "TagID", ...)
{
   do.call(rbind, by(df, df[[id_column]], id_one_shed, ...))
}

##' Identify a shed or gap in a single fish detection history.
##'
##' Identify a shed or gap in a single fish detection history.
##' 
##' @title Identify shed for one tag
##' @param df a data.frame of detection history for a single tagID,
##'     i.e., a single fish
##' @param max_last_residence integer, the max residence time allowed,
##'     in days
##' @param max_gap integer, the max gap allowed, in days
##' @param id_col character, the name of the TagID column
##' @param stn_col character, the name of the stations column
##' @param arrival_col character, the name of the arrivals column
##' @param depart_col character, the name of the departures column
##' @return a data.frame for a single fish, with logical columns
##'     indicating if this tag was likely a shed, or if it had large
##'     gap in the detection history
##' @author Matt Espe
##' @export
id_one_shed = function(df,
                       max_last_residence = 7, # days
                       max_gap_days = 60, # days
                       id_col = "TagID",
                       stn_col = "GroupedStn",
                       arrival_col = "arrival",
                       depart_col = "departure")
{
    df = df[order(df[[arrival_col]]),]

    res_times = last_residence_time(df, arrival_col, depart_col)
    
    gaps = max_gap(df, arrival_col, depart_col)
    
    is_shed = res_times[length(res_times)] > max_last_residence
    
    return(data.frame(TagID = unique(df[[id_col]]),
                      shed = is_shed,
                      long_gap = any(gaps > max_gap_days, na.rm = TRUE)))    
}

last_residence_time = function(df,
                               arrival_column = "arrival",
                               depart_column = "departure",
                               unit = "days")
{
    i = which.max(df[[arrival_column]])

    difftime(df[i, depart_column], df[i, arrival_column], units = unit)
}

residence_times = function(df_splits, time_column = "DateTimePST", unit = "days")
{
    d = switch(unit,
               days = 60*60*24,
               hours = 60*60,
               min = 60,
               sec = 1)

    arrival_times = sapply(df_splits, function(x) min(x$DateTimePST))
    i = order(arrival_times)
    diff(arrival_times[i]) / d
}



residence_time = function(df, time_column = "DateTimePST", unit = "days")
{
    rr = range(df[[time_column]])
    difftime(rr[2], rr[1], units = unit)
}

max_gap = function(df, arrive_column = "arrival",
                   depart_column = "departure", unit = "days")
{
    if(nrow(df) == 1)
        return(NA)
    ## Default is to return in sec
    n = nrow(df)
    max(difftime(df[[arrive_column]][-1], df[[depart_column]][-n], units = unit))
}

##' Truncates the detection histories to either a number of days or
##' hours after the fish first visit a station, or if a timestamp is
##' provided, to that timestamp.
##' 
##' @title Truncate Detection Histories
##' @param raw_detection_df data.frame of raw detection histories
##' @param TagIDs vector, the TagIDs to truncate
##' @param keep_last integer, amount of detections to keep in the
##'     final station history
##' @param units character, either days or hours
##' @param time_stamps Optional, if provided these are used as the
##'     cutoff for each tagID. There must be one time_stamp for each
##'     tagID. The function will only include DateTimes which are less
##'     or equal to this timestep in the results
##' @param TagID_col character, the column name for the TagID
##' @param Station_col character, the column name for the station
##' @param DateTime_col character, the column name for DateTime
##' @return data.frame, with shed tags truncated
##' @author Matt Espe
##' @export
truncate_sheds = function(raw_detection_df, TagIDs, keep_last = 2L,
                          units = "days",
                          time_stamps = NULL, 
                          TagID_col = "TagID",
                          Station_col = "GroupedStn",
                          DateTime_col = "DateTimePST")
{
    if(!is.character(TagIDs))
        TagIDs = as.character(TagIDs)
    
    if(!is.null(time_stamps) && length(TagIDs) != length(time_stamps))
        stop("Please provide the same number of time_stamps as TagIDs")
    
    dfs_split = split(raw_detection_df, raw_detection_df[[TagID_col]])

    if(is.null(time_stamps))
        time_stamps = sapply(dfs_split[TagIDs], find_one_cutpt, keep = keep_last,
                           unit = units, datetime_col = DateTime_col,
                           station_col = Station_col)

    dfs_split[TagIDs] = mapply(trunc_one, df = dfs_split[TagIDs],
                          cut_pt = time_stamps, datetime_col = DateTime_col,
                          SIMPLIFY = FALSE)
    do.call(rbind,dfs_split)    
}

trunc_one = function(df, cut_pt, datetime_col = "DateTimePST")
{
    i = df[[datetime_col]] <= cut_pt
    if(all(i))
        warning("No data cut from: ", unique(df$TagID))

    df[i,]  
}


find_one_cutpt = function(df, keep = 2,
                          datetime_col = "DateTimePST",
                          station_col = "GroupedStn",
                          unit = "days",
                          adjust = switch(unit, days = 60*60*24, hours = 60*60))
{
    df = df[order(df[[datetime_col]]),]
    last_station = df[[station_col]][nrow(df)]
    arrival = df[[datetime_col]][df[[station_col]] == last_station][1]

    cutpt = arrival + adjust * keep

    i = rev(which(df[[datetime_col]] <= cutpt))[1]
    if(is.na(i))
        stop("No valid cutpoint found.") ## might be a bad idea

    return(df[[datetime_col]][i])
}

if(FALSE){
overlap_hist = function(df)
{
    sapply(seq_along(df$arrival), function(i){
        x = df$arrival[i]
        any(x > df$arrival[-i] & x < df$departure[-i])
    })
}

}
