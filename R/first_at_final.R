#' Subset first detection of a fish + first detection at its final known location
#' 
#' @param dets_df a dataframe of detections
#' @param tagid_col Name of the column (in quotes) corresponding to individual tag IDs
#' @param datetime_col Name of the column corresponding to detection date and time (must be in POSIXct ymd_hms format)
#' @param station_col Name of the column corresponding to location or station information
#' @return a dataframe with five columns: TagID, first_det (first detection of tag), first_stn (first station),
#' last_arrival (first detection time at final station), last_stn (station where last arrival was recorded).
#' @details #' This function takes a dataframe of detections and extracts the first detection of each tag, and the
#' first detection at each tag's last station, and returns a dataframe with this information so that the travel
#' time can be easily calculated across the two columns.
#' @author Myfanwy Johnston
#'@export


first_at_final <- function(dets_df, 
                       tagid_col = "TagID", 
                       datetime_col = "DateTimeUTC", 
                       station_col= "Station") {
  
  if(!is(dets_df[[datetime_col]], "POSIXct")) stop("Date-time column is not POSIXct")
  
  do.call(rbind, lapply(split(dets_df, dets_df[[tagid_col]]), faf_onefish,  
                                                   tidc2 = tagid_col,
                                                   dtc2 = datetime_col,
                                                   stnc2 = station_col))
  }


#internal function for first_at_final:

faf_onefish <- function(x, tidc2, dtc2, stnc2) {
  
   x = x[order(x[[dtc2]]), ] # order detdf by datetime; makes the first row the min detection

   x$rleidcol = rleid(x[[stnc2]]) # assign visit numbers
  
  first_det_row = x[1, ] # pull first det row (min detection)
  intermed_rows = x[x$rleidcol == max(x$rleidcol), ] # pull all rows at max station

  return(data.frame(

    TagID = unique(x[[tidc2]]),

    first_det = first_det_row[[dtc2]],
    first_stn = first_det_row[[stnc2]],

    last_arrival =  intermed_rows[[dtc2]][1], 
    last_stn = intermed_rows[[stnc2]][1],

    stringsAsFactors = FALSE

    )
  )
}



# old code
if(FALSE) {
last_first <- function(detdf, tagidcol = "TagID", datetimecol = "DateTimeUTC", stationcol= "Station") {

  do.call(rbind, lapply(split(detdf, detdf$TagID), lastfirst_1fish,
                                                   tidc2 = tagidcol,
                                                   dtc2 = datetimecol,
                                                   stnc2 = stationcol))
  }


lastfirst_1fish <- function(x, tidc2, dtc2, stnc2) {

  x = x[order(x[[dtc2]]), ] # order detdf by datetime

  # First check to see if a fish has only one station associated with it:
  if(length(unique(x[[stnc2]])) == 1) {

    first_det_row = x[x[[dtc2]] == min(x[[dtc2]]), ] #  pull first det
    acting_last_det_row = x[x[[dtc2]] == max(x[[dtc2]]), ] # & last det at last station

  return(data.frame(

    TagID = as.numeric(unique(x[[tidc2]])),

    first_det = first_det_row[[dtc2]],
    first_stn = first_det_row[[stnc2]],

    last_arrival = acting_last_det_row[[dtc2]],
    last_stn = acting_last_det_row[[stnc2]],

    stringsAsFactors = FALSE
  ))

} else {

  x$rleidcol = data.table::rleid(x[[stnc2]]) # assign visit numbers
  first_det_row = x[x[[dtc2]] == min(x[[dtc2]]), ] # pull first det row
  intermed_rows = x[x$rleidcol == max(x$rleidcol), ] # pull all rows at max station

  if(length(unique(intermed_rows[[stnc2]])) > 1) print("FYI - one or more of your tags has multiple simultaneous detections at the final location")

  intermed_rows = intermed_rows[!duplicated(intermed_rows[[dtc2]]), ] # filter out simultaneous dets

  # pull first detection at last station:
acting_last_det_row =
    intermed_rows[intermed_rows[[dtc2]] == min(intermed_rows[[dtc2]]), ]

  return(data.frame(

    TagID = as.numeric(unique(x[[tidc2]])),

    first_det = first_det_row[[dtc2]],
    first_stn = first_det_row[[stnc2]],

    last_arrival = acting_last_det_row[[dtc2]],
    last_stn = acting_last_det_row[[stnc2]],

    stringsAsFactors = FALSE

    ))
  }
}
}