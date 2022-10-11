#' Identify orphaned detections between deployment and detection records
#' @param detections_df a dataframe of detections
#' @param deployments_df a data frame of receiver deployments
#' @param fuzzy_match desired time threshold to expand the deployment windows by in order to accommodate slight mismatches between deployment windows and detections
#' @details relies on data.table::foverlaps() to accomplish the merge.  Warnings will issue if you have detections with no matching deployments, or if you have detections with multiple matching deployments (some of which are probably caused by the fuzzy_match).
#' @return data frame of detections with deployment data brought in, where NAs in the ExpandedStart and ExpandedEnd columns indicate orphaned detections.
#' @author Myfanwy Johnston
#' @export
#' 
find_orphans <- function(detections_df, deployments_df,  fuzzy_match = 60*60, ...) {
  
  x = as.data.table(detections_df)
  y = as.data.table(deployments_df)
  
  y$ExpandedStart = y$DeploymentStart - fuzzy_match
  y$ExpandedEnd = y$DeploymentEnd + fuzzy_match
  
  x$end = detections_df$DateTimePST 
  
  setkey(y, Receiver, ExpandedStart, ExpandedEnd)
  result = foverlaps(x, y, by.x = c('Receiver', 'DateTimePST', 'end'), type = 'within', ...)
  result <- as.data.frame(result)
  result$end = NULL
  if(sum(is.na(result$DeploymentStart)) > 0){
    warning("warning: the resulting dataframe contains NAs in the joining columns - these indicate orphan detections")
  }
  if(nrow(detections_df) < nrow(result)) warning("warning: some detections have multiple matches in the deployment records - check the number of resulting rows against detections_df")
  return(result)
}