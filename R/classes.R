##' Telemetry data
##'
##' An S4 object holding the relevant data for a set of telemetry
##' detections
##' 
##' @slot detections
##' @slot tagging
##' @slot deployment
##' @slot quality_control_status
##' @export
setClass("telemetry",
         slots = c(detections = "data.frame",
                   tagging = "data.frame",
                   deployment = "data.frame",
                   quality_control_status = "logical",
                   quality_control_data = "list",
                   meta_data = "list"))

