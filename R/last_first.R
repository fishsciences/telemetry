#' last_first: extract the first detection of a fish at its last known location.
#'
#' This function takes a dataframe of detections and extracts the first detection of each tag, and the first detection at each tag's last station, and returns a dataframe with this information so that the travel time can then be easily calculated
#'
#' @title Find a tag's first detection at its last location
#'
#' @param detdf a dataframe of detections for multiple tagged animals
#' @param tagidcol Name of the column (in quotes) corresponding to individual tag IDs
#' @param datetimecol Name of the column corresponding to detection date and time (must be in POSIXct ymd_hm/s format)
#' @param stationcol Name of the column corresponding to location or station information
#' @return a dataframe with five columns: TagID, first_det (first detection of tag), first_stn (first station), last_arrival (first detection time at final station), last_stn (station where last arrival was recorded).
#' @author Myfanwy Johnston
#'
#' @export
#'


last_first <- function(detdf, tagidcol = "TagID", datetimecol = "DateTimeUTC", stationcol= "Station") {

  do.call(rbind, lapply(split(detdf, detdf$TagID), lastfirst_1fish,
                                                   tidc2 = tagidcol,
                                                   dtc2 = datetimecol,
                                                   stnc2 = stationcol))
  }


#' internal function for last_first:
#'
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
