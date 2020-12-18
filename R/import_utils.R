# general functions for importing data

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
