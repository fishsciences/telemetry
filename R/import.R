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

remove_duplicate_cols = function(x)
{
    if(is.null(x)) return(NULL)
    
    dup_cols = duplicated(as.matrix(x), MARGIN = 2)
    x[!dup_cols]
}

standardize_col_names = function(cnms,
                                 colname_regex = c(TagID = "tag[-_.]?id|fish[-_.]?id",
                                                   CodeSpace = "codespace",
                                                   ReceiverID = "receiver[-_.]?id",
                                                   DateTime = "datetime",
                                                   TagType = "tagtype",
                                                   ReceiverGroups = "receivergroups"))
                                                
{
    cnms_tmp = tolower(cnms)
    # run sparingly and not concerned about efficiency - for loop is fine
    for(rx_i in seq(along = colname_regex)){
        i = grep(colname_regex[rx_i], cnms_tmp)
        if(length(i) > 1)
            stop("More than one match for regex '",
                 colname_regex[rx_i],
                 "'. Please refine regex or remove duplicate columns.")
        if(length(i))
            cnms[i] = names(colname_regex)[rx_i]
    }
    
    cnms
}
