
# function operates on a dataframe of a single station.  The rows in the data frame may or may not need to be split up further according to the threshold.

redRowFun =
  function(d, dtc1)
  {
    
    # vector of change points from a logical vector of rows whose diff > TimeThresh; every time it increments, that represents the row that should become a new station visit
    if(nrow(d) > 1) {
      breakup_vector = cumsum(c(0, diff(d[[dtc2]])) > TimeThreshold ) # vector
      
      # Example:
      # set.seed(1)
      # x = runif(6)
      # thresh = 0.25
      # abs(diff(x)) > thresh # should be F, F, T, T, T
      # bv = cumsum(c(0, abs(diff(x))) > thresh) # should be: 0, 0, 0, 1, 2, 3; i.e., rows, 5, and 6 should have their own visits
      if(any(breakup_vector)) {
        tmp = by(d, breakup_vector, redRowFun, dtc1)
        return(do.call(rbind, tmp)) 
      }
    }
    # default:      
    r = as.POSIXct(range(d[[dtc1]])) # first and last detection
    data.frame(d[1,], # use first row with all its columns
               arrival = r[1], # add arrival time
               departure = r[2], # and departure time
               stringsAsFactors = FALSE)
    
  }

splitFishStationVisits =
  function(d, 
           Station_col,
           TimeThreshold = Threshold,
           rowFunc = redRowFun,
           dtc2 = Datetime_col)
  {
    j = order(d[[dtc2]])
    d = d[ j , ] # order dataframe by DateTimeUTC
    
    ## index of continuous times
    
    g = rleid(Station_col[j])
    
    ans = by(d, g, rowFunc, dtc1 = dtc2) # apply redRowFun by the station visit ID to the dataframe
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
#'Tagtales: should reflect the tag residence at each receiver, in chronological order.  
#' For each fish:
#'  
#' 1. order by DateTime
#' 2. split by station (assumption: stations are grouped appropriately)
#' 3. order by Datetime within station
#' 4. create an rleid of the station column
#' 5. apply the redRowFun to each rleid
#' 
#' 4. if df consists of a single detection repeat the timestamp as both arrival and departure
#' 5. if nrow(df) > 1, then:
#'   - split the detection history into multiple visits at points where the difference between two detections is 
#'   > threshold.
#'        - this is done by calculating the diff between rows where the station ID changes
#'
#' 6. Use the first detection as "arrival", last detection as "departure" for each visit
#'
#' @return dataframe with fishpaths for each tagID
#' @export
#'

tag_tales <- function(detdf, 
                      TagID_col, 
                      Station_col,
                      Datetime_col = "DateTimeUTC", 
                      Threshold = 60*60,
                      allow_overlap = TRUE) {

    if(is.character(TagID_col) && length(TagID_col) != nrow(detdf))
        TagID_col = detdf[[TagID_col]]
    if(is.character(Station_col) && length(Station_col) != nrow(detdf))
        Station_col = detdf[[Station_col]]
    
   f1 <- split(detdf, TagID_col)
    
   f1 <- f1[ sapply(f1, nrow) > 0 ]
  
  tmp = lapply(f1, splitFishStationVisits, 
               Station_col = Station_col, 
               dtc2 = Datetime_col, 
               TimeThreshold = Threshold, 
               overlap = allow_overlap)
  
  do.call(rbind, tmp)
   
}

