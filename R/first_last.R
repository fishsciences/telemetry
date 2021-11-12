#' Subset to first (minimum) and last (maximum) detection and stations of a tagged animal
#'
#' @param detdf A detections dataframe
#' @param datetimecol Name of the column (in quotes) corresponding to detection date and time. Default is "DateTimeUTC". Column must be in POSIXct ymd_hm or ymd_hms format)
#'
#' @return a subset of the original dataframe with two rows for each fish (the top row is the minimum detection for that fish, the bottom row is the maximum detection)
#' @details in cases where the fish only has one detection associated, or where the first and last detections represent simultaneous detections, only one row will be returned.
#' 
#' @author Myfanwy Johnston
#'@export
#'
#'
first_and_last <- function(dets_df, 
                           tagid_col = "TagID",
                           datetime_col = "DateTimeUTC") {

  f1 <- split(dets_df, dets_df[[tagid_col]])
  
  tmp <- lapply(f1, fl_onefish, 
                datetime = datetime_col)
  
  fldf = do.call(rbind, tmp)
                 
  return(fldf) }



fl_onefish = function(df, 
                      datetime = "DateTimeUTC") {
  
  # check
  if(!is.data.frame(df)) stop("input data must be of class 'data.frame'")
  
  dt_col = df[[datetime]] # assign datetime column 
    if(!is(dt_col, "POSIXct")) stop("Datetime column is not POSIXct")

  firstlast = rbind(
                df[dt_col == min(dt_col), ], # min det
                df[dt_col == max(dt_col), ] # max det
                  )
  
  firstlast[!duplicated(firstlast[[datetime]]), ] # could be slow
  
}



# old code
if(FALSE){
  
  first_last <- function(detdf, 
                         tagidcol = "TagID", 
                         datetimecol = "DateTimeUTC", 
                         stationcol = "Station") {

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
}