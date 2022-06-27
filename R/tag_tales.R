# redRowFun operates on a dataframe of a single station passed from splitFishStationVisits.  The rows in the data frame may or may not need to be split up further via to the time threshold threshold.

redRowFun = function(visits, dtc3, t3)
   {
    # vector of change points from a logical vector of rows whose diff > TimeThresh; each increment represents the row that should become a new station visit
    if(nrow(visits) > 1) {
      breakup_vector = cumsum(c(0, diff(visits[[dtc3]])) > t3 ) # vector
      
      if(any(breakup_vector)) {
        tmp = by(visits, breakup_vector, redRowFun, dtc3, t3 = t3) # function calls itself to iterate through all the visits
        return(do.call(rbind, tmp)) 
      }
    }
       
    r = as.POSIXct(range(visits[[dtc3]])) # first and last detection
    data.frame(visits[1,], # use first row with all its columns
               arrival = r[1], # add arrival time
               departure = r[2], # and departure time
               stringsAsFactors = FALSE)
    
  }

# orders a fish's history, and applies an index to each station's detections, then applies redRowFunc to get the visits according to the time threshold

splitFishStationVisits =
  function(d, 
           s2,
           t2,
           rowFunc = redRowFun,
           dtc2)
  {
    j = order(d[[dtc2]])
    d = d[ j , ] 
    
    ## index of continuous times
    
    g = data.table::rleid(s2[j])
    
    ans = by(d, g, rowFunc, dtc3 = dtc2, t3 = t2) # apply redRowFun by the station visit ID to the dataframe
    do.call(rbind, ans) # bind that into a dataframe
  }

#' Construct coherent individual movement paths from tag detection history dataframe
#'
#' @param detdf a dataframe of detections
#' @param TagID_col column containing unique fish identification codes
#' @param Station_col column containing unique station codes or names
#' @param Datetime_col column containing date and time of detection,
#'     in POSIXct format YYYY-MM-DD HH:MM:SS
#' @param Threshold desired time threshold between station visits, in
#'     seconds.  See details.
#' @details The time threshold allows you to delineate the period of
#'     time that detections can be separated from each other at a
#'     receiver and still be considered part of the same "stay" at
#'     that receiver.  The default is 1 hour "(`60*60`)".  If you set
#'     Threshold = "`60*60*2`", that means that after a fish arrives
#'     at a receiver, all detections that occur at that receiver
#'     within two hours of the first arrival are considered part of the
#'     same "stay" at that receiver. The tag_tales function assumes that all stations are spatially distinct,
#'     and that any receivers that are close in space (and could result in
#'     simultaneous detections) have already been grouped in the data by station name.
#'     
#' @return dataframe with fishpaths for each tagID
#' @export
#'

tag_tales <- function(detdf, 
                      TagID_col, 
                      Station_col,
                      Datetime_col = "DateTimeUTC", 
                      Threshold = 60*60) {

    if(is.character(TagID_col) && length(TagID_col) != nrow(detdf))
        TagID_col = detdf[[TagID_col]]
    if(is.character(Station_col) && length(Station_col) != nrow(detdf))
        Station_col = detdf[[Station_col]]
    
   f1 <- split(detdf, TagID_col)
    
   f1 <- f1[ sapply(f1, nrow) > 0 ]
  
   tmp = lapply(f1, 
               splitFishStationVisits, 
               s2 = Station_col, 
               dtc2 = Datetime_col, 
               t2 = Threshold)
  
  do.call(rbind, tmp)
   
}

