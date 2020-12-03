

redRowFun =
  function(d, dtc1)
  {
    r = as.POSIXct(range(d[[dtc1]]))
    data.frame(d[1,],
               arrival = r[1],
               departure = r[2],
               stringsAsFactors = FALSE)
  }

splitFishStationVisits =
    function(d, Station_col,
             TimeThreshold = Threshold,
             rowFunc = redRowFun,
             dtc2 = Datetime_col, overlap = TRUE)
{
    j = order(d[[dtc2]])
    d = d[ j , ] #order dataframe by DateTimeUTC

    ## index of continuous times
    g = cumsum( c(0, diff(d[[dtc2]])) > TimeThreshold )

    ## index of both conditions
    # make new index with unique visits if overlap == FALSE
    if(!overlap){
        ## index of continuous stations
        rr = rle(Station_col[j])
        i = rep(seq(along = rr$lengths), times = rr$lengths)
        
        g = paste(i, g)
    }
    
    ans = by(d, g, rowFunc, dtc1 = dtc2) # apply redRowFun by the grouping variable g to the dataframe
    do.call(rbind, ans) # bind that into a dataframe
}

#' Contstruct coherant individual movement paths from tag detection history dataframe
#'
#' @param detdf a dataframe of detections
#' @param TagID_col column containing unique fish identification codes
#' @param Station_col column containing unique station codes or names
#' @param Datetime_col column containing date and time of detection,
#'     in POSIXct format YYYY-MM-DD HH:MM:SS
#' @param Threshold desired time threshold between station visits, in
#'     seconds.  See details.
#' @param allow_overlap logical, if TRUE the fish paths are allowed to
#'     overlap so long as the threshold has not been exceeded
#' @details The time threshold allows you to delineate the period of
#'     time that detections can be separated from each other at a
#'     receiver and still be considered part of the same "stay" at
#'     that receiver.  The default is 1 hour "(`60*60`)".  If you set
#'     Threshold = "`60*60*2`", that means that after a fish arrives
#'     at a receiver, all detections that occur at that receiver
#'     within 2 hours of the first arrival are considered part of the
#'     same "stay" at that receiver.
#'
#'
#' @return dataframe with fishpaths for each tagID
#' @export
#'

tag_tales <- function(detdf, TagID_col, Station_col,
                      Datetime_col="DateTimeUTC", Threshold = 60*60,
                      allow_overlap = TRUE) {

    if(is.character(TagID_col) && length(TagID_col) != nrow(detdf))
        TagID_col = detdf[[TagID_col]]
    if(is.character(Station_col) && length(Station_col) != nrow(detdf))
        Station_col = detdf[[Station_col]]
    
    f1 <- split(detdf, TagID_col)
    
  f1 <- f1[ sapply(f1, nrow) > 0 ]
  tmp = lapply(f1, splitFishStationVisits, Station_col = Station_col, dtc2 = Datetime_col, TimeThreshold = Threshold, overlap = allow_overlap)
  do.call(rbind, tmp)
   
}

