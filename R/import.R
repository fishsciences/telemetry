import_seis_data = function(detections, tagging, deployments = NULL,
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
    

}
