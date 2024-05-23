##' A utility for creating a nested list for marshalling to JSON from
##' a simple data.frame. This function will rarely be called on its
##' own - instead, it is called from inside \code{api_upload_data()}.
##'
##' @title Create Registration Data
##' @param df data.frame, with column names exactly "unAntName",
##'   "unTagName", "regDataTime"
##' @param data_cols character, the name of columns to use for the
##'   data payload.
##' @param req_cols character, the names of columns required to be in
##'   the data.frame
##' @return
##' @author Matt Espe
##' @export
##' @examples
##' \dontrun{
##' create_registration_data(detection_data, data_cols = c("temp_C", "turbidity"))
##' }
create_registration_data = function(df,
                                    data_cols,
                                    req_cols = c("unAntName", "unTagName",
                                                 "regDataTime"))
{
  
  if(!all(req_cols %in% colnames(df)))
    stop("Missing columns in data.frame: ",
         paste(setdiff(req_cols,
                       colnames(df)), collapse = ", "))

  if(!all(sapply(df[req_cols], class) == "character")){
    warning("Converting required columns to character")
    df[req_cols] = lapply(df[req_cols], as.character)
  }
    
  ## Check the df here for data types?
  lapply(seq(nrow(df)), function(i) create_one_registration(df[i,], data_cols))
}

create_one_registration = function(df, other_cols)
{
  list(regDataAnt = c(unAntName = df$unAntName),
       regDataData = unlist(df[other_cols]),
       regDataTag = c(unTagName = df$unTagName),
       regDataTime = c(df$regDataTime))
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
##' @examples
##' \dontrun{
##' test_df = data.frame(unAntName = "NATO-StanNetwork-1",
##'                      unTagName = 99999,
##'                      regDataTime = format(Sys.time(), "%FT%T%z"),
##'                      temp = 39.0,
##'                      test2 = 2)
##'   api_upload_data(my_session, test_df, c("temp"))
##' }
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
    upReqData = create_registration_data(registration_data,
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
    stop(h$value()["status"], ": ", h$value()["statusMessage"], "\n", rsp)
  
  return(TRUE)
  
}
