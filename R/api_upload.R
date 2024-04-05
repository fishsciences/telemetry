create_registration_data = function(df,
                                    data_cols,
                                    req_cols = c("unAntName", "unTagName",
                                                 "regDataTime"))
{
  
  if(!all(req_cols %in% colnames(df)))
    stop("Missing columns in data.frame: ",
         paste(setdiff(req_cols,
                       colnames(df)), collapse = ", "))
  
  ## Check the df here for data types?
  lapply(seq(nrow(df)), function(i) create_one_ant(df[i,]))
}

create_one_registration = function(df)
{
  list(regDataAnt = c(unAntName = df$unAntName),
       regDataTag = c(unTagName = df$unTagName),
       regDataTime = df$regDataTime,
       regDataData = toJSON(df[,other_cols]))
}

##' @param registration_data data.frame containing registration data
##'   to upload. Must have columns named "unAntName", "unTagName",
##'   "regDataTime"
##' @param other_data_column_names character vector, the names of
##'   other columns from the \code{registration_data} to include in
##'   the "data" slot of the data payload. Will be marshalled to JSON
##'   before the upload.
##' @rdname send_api_request
##' @export
api_upload_data = function(session,
                           registration_data,
                           other_data_column_names,
                           end_point = "/api/data/upload",
                           token = session$unToken,
                           curl_handle = session$curl,
                           api_baseurl = session$base_url,
                           api_url = paste0(api_baseurl, end_point),
                           .curlOpts = list())
{
  payload = list(
    upRegData = create_registration_data(registration_data,
                                         other_data_column_names),
    upReqTok = list(unToken = token))
  
  h = basicHeaderGatherer()
  
  rsp = getURL(url = api_url,
               httpheader = c("Content-Type" = "application/json"),
               postfields = toJSON(payload),
               headerfunction = h$update,
               curl = curl_handle,
               .opts = .curlOpts)
  
  # handle errors here
  if(h$value()["status"] != "204")
    stop(h$value()["status"], ": ", h$value()["statusMessage"])
  
  fromJSON(rsp)
  
}