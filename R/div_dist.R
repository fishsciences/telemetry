#' Divide distance evenly across a units of a time span
#'
#' @param start 
#' @param end 
#' @param distance 
#' @param time_units 
#'
#' @return data frame with columns \itemize{
#'   \item date_time: POSIXct column of date/time stamps in the units specified by time_units
#'   \item prop_dist: the proportion of the distance allocated to each `date_time` row
#'   }
#' 
#' @export
#'

div_dist = function(start, end, distance, time_units = "hour") {
  
  v = seq.POSIXt(from = start, to = end, 
                 by = time_units)
  data.frame(date_time = v,
             prop_dist = rep(distance/length(v), length(v)))
  
}

#' @examples
#' tt = as.POSIXct(c("2020-01-01 00:00:00", "2020-01-02 12:00:00"))
#' div_dist(tt[1], tt[2], distance = 10)