

#' Get first (minimum) and last (maximum) detection and stations of a tagged animal
#'
#' @param detdf A detections dataframe
#' @param tagidcol Name of the column (in quotes) corresponding to individual tag IDs
#' @param datetimecol Name of the column corresponding to detection date and time (must be in POSIXct ymd_hm/s format)
#' @param stationcol Name of the column corresponding to location or station information
#'
#' @return a dataframe with five columns: TagID, first_det (first detection of tag), first_stn (first station), last_det (last detection time at final station), last_stn (station where last arrival was recorded).
#' @author Myfanwy Johnston
#'@export
#'
first_last <- function(detdf, tagidcol = "TagID", datetimecol = "DateTimeUTC", stationcol = "Station") {

  f1 <- split(detdf, detdf[[tagidcol]])
  tmp <- lapply(f1, first_last_1fish, 
                dtc2 = datetimecol, 
                stnc2 = stationcol, 
                tagc = tagidcol)
  fldf = do.call(rbind, tmp)
                 
  return(fldf) }
                 


first_last_1fish <- function(x, 
                             dtc2 = datetimecol, 
                             tagc = tagidcol,
                             stnc2 = stationcol) {

     x = x[order(x[[dtc2]]), ] # order by DateTime

     return(data.frame(

       TagID = unique(x[[tagc]]),

       first_det = min(x[[dtc2]]),

       first_stn = x[[stnc2]][x[[dtc2]] == min(x[[dtc2]])],

       last_det = max(x[[dtc2]]),

       last_stn = x[[stnc2]][x[[dtc2]] == max(x[[dtc2]])],

       stringsAsFactors = FALSE)
     )
}
