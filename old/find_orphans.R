#' Identify orphaned detections between deployment and detection records
#' @param detections_df a dataframe of detections
#' @param deployments_df a data frame of receiver deployments
#' @param fuzzy_match desired time threshold to expand the deployment windows by in order to accommodate slight mismatches between deployment windows and detections
#' @param ... arguments passed on to data.table::foverlaps()
#' @details relies on data.table::foverlaps() to accomplish the merge.  Warnings will issue if you have detections with no matching deployments, or if you have detections with multiple matching deployments (some of which are caused by the fuzzy_match).
#' @return data frame of detections with deployment data brought in, where NAs in the ExpandedStart and ExpandedEnd columns indicate orphaned detections.
#' @author Myfanwy Johnston
#' @export
#' 
find_orphans <- function(detections_df, deployments_df, 
                         deployment_start_col = "DeploymentStart",
                         deployment_end_col = "DeploymentEnd",
                         deployment_rec_col = "Receiver",
                         detections_df_datetime_col = "DateTimePST",
                         fuzzy_match = 60*60,
                         ...) {
  
  x = as.data.table(detections_df)
  y = as.data.table(deployments_df)
  
 # if(any(c("ExpandedStart", "ExpandedEnd") %in% colnames(y))) 
  
  y$ExpandedStart = y[[deployment_start_col]] - fuzzy_match
  y$ExpandedEnd = y[[deployment_end_col]] + fuzzy_match
  
  x$end = detections_df[[detections_df_datetime_col]]
  
  setkeyv(y, cols = c(deployment_rec_col, "ExpandedStart", "ExpandedEnd"))
          
  result = foverlaps(x, y, 
                     by.x = c(deployment_rec_col, detections_df_datetime_col, 'end'), 
                     type = 'within', 
                     ...)
  result <- as.data.frame(result)
  result$end = NULL
  if(sum(is.na(result[[deployment_start_col]])) > 0){
    warning("warning: the resulting dataframe contains NAs in the joining columns - these indicate orphan detections")
  }
  if(nrow(detections_df) < nrow(result)) warning("warning: some detections have multiple matches in the deployment records - check the number of resulting rows against detections_df")
  return(result)
}