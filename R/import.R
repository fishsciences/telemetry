import_generic_data = function(detections, tagging, deployments = NULL,
                            meta_data = NULL,
                            remove_duplicate_cols = TRUE,
                            rename_cols = TRUE)

{
    tabs = list(detections = detections,
                tagging = tagging,
                deployments = deployments)

    if(remove_duplicate_cols)
        tabs = lapply(tabs, remove_duplicate_cols)

    if(rename_cols)
        tabs = lapply(tabs, function(df){
            colnames(df) = standardize_col_names(colnames(df))
            df})

    # Standardizing col classes not optional - required for functions
    # later so needs to happen
    tabs = lapply(tabs, standardize_col_classes)
    
    data = list(tabs, meta_data = meta_data, qc_status = FALSE)
    as(data, "telemetry")

}

import_seis_data = function(detections, tagging, deployments = NULL,
                            meta_data = NULL,
                            remove_duplicate_cols = TRUE,
                            rename_cols = TRUE)
    
{
    # Additional steps needed for SEIS data, if any

    import_generic_data(detections = detections,
                        tagging = tagging,
                        deployments = deployments,
                        meta_data = meta_data,
                        remove_duplicate_cols = remove_duplicate_cols,
                        rename_cols = rename_cols)
    
}
