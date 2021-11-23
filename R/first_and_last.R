#' Subset to first (minimum) and last (maximum) detection and stations of a tagged animal
#'
#'@param dets_df A data frame of detections for one or more tags
#'@param tagid_col Quoted name of column corresponding to the Tag Identification (TagID, Transmitter, etc)
#'@param datetime_col Name of the column (in quotes) corresponding to detection date and time. Default is "DateTimeUTC". Column must be in POSIXct ymd_hm or ymd_hms format.
#'
#'@return a subset of the original dataframe with two rows for each fish (the top row is the minimum detection for that fish, the bottom row is the maximum detection)
#'@details in cases where the fish only has one detection associated, or where the first and last detections represent simultaneous detections, only one row will be returned.
#' 
#'@author Myfanwy Johnston
#'@export
#'
#'
first_and_last <- function(dets_df, 
                           tagid_col = "TagID",
                           datetime_col = "DateTimeUTC") {

  f1 <- split(dets_df, dets_df[[tagid_col]])
  
  tmp <- lapply(f1, fl_onefish, datetime = datetime_col)
  
  fldf = do.call(rbind, tmp)
                 
  return(fldf) } # do I need this?


# internal function - does operation for one fish

fl_onefish = function(df, 
                      datetime = "DateTimeUTC") {
  
  # check
  if(!is.data.frame(df)) stop("input data must be of class 'data.frame'")
  
  dt_col = df[[datetime]] # assign datetime column 
    if(!is(dt_col, "POSIXct")) stop("Datetime column is not POSIXct")

  firstlast =    df[c(which.min(dt_col), which.max(dt_col)), ]
  
  firstlast[!duplicated(firstlast[[datetime]]), ] # could be slow
  
}