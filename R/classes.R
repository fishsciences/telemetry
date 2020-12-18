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

# This is where we will do a lot of checks on the object validity
# Many of these would normally be done as part of QA/QC,
# but here we are using R's mechanisms to do the checks as part of
# the class
setValidity("telemetry",
  function(object){
      # Check detections all in tagging      

      # 

      TRUE
  })


setAs("list", "telemetry",
      function(from){
          
          
      })
