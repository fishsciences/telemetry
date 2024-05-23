##' Downloads the data for a specific user, species, and region into a
##' temporarly (or not) SQLite3 database. The data can be extracted
##' from this database via the \code{extract_data()} function.
##'
##' @title Download Data
##' @param session list, an object created by \code{start_session()}
##' @param region integer, optional??
##' @param speciesID integer, optional??
##' @param token character, the token for the established session
##' @param curl_handle a curl handle for the established session
##' @param api_baseurl character, the base URL for the database API
##' @param db_file character, the file to store the downloaded data in. Defaults to a temporary file.
##' @param end_point character, the suffix for the download end point
##' @param api_url character, the full url for the API end point for downloading data
##' @param ... additional arguments passed to \code{getBinaryURL()}
##' @return character 
##' @author Matt Espe
##' @export
##' @examples
##' \dontrun{
##' # All data
##' detection_db = download_data(my_session)
##'
##' # One species
##' detection_db = dowloand(data(my_session, speciesID = 1)
##'
##' # defaults to putting tables in an environment
##' detection_data = extract_data(detection_db)
##'
##' # Access data via $
##' names(detection_data)
##' detection_data$Registrations
##' as.list(detection_data)
##' }
download_data = function(session,
                         region,
                         speciesID,
                         token = session$unToken,
                         curl_handle = session$curl,
                         api_baseurl = session$base_url,
                         db_file = tempfile(),
                         end_point = "/api/data/download",
                         api_url = paste0(api_baseurl, end_point),
                         ...)
{
  
  payload = list(downReqTok = c(unToken = token), downReqSpec = list())

  if(!missing(speciesID))
    payload$downReqSpec$downloadSpeciesID = c(unSpecID = speciesID)
  if(!missing(region))
    payload$downReqSpec$downloadRegion = c(unRegion = region)
  
  payload = toJSON(payload, collapse = " ")
  payload = gsub("\\[\\]", "{}", payload) ## Hack to get the downReqSpec right
  
  ## browser()
  # for request status
  h = basicHeaderGatherer()
  rsp = getBinaryURL(url = api_url,
                     httpheader = c("Content-Type" = "application/json"),
                     postfields = payload,
                     headerfunction = h$update,
                     ## curl = curl_handle,
                     ...)
  # handle errors here
  if(h$value()["status"] != "200")
    stop(h$value()["status"], ": ", h$value()["statusMessage"])

  # should be caught w/status code - test and then remove this if possible
  if(rawToChar(rsp[1:5]) %in% c("Error", "Autho"))
    stop(rawToChar(rsp))
  
  writeBin(rsp, con = db_file)
  return(db_file)
}


##' Extracts all tables from an input database into data.frames inside
##' an isolated environment. If the \code{env} variable is set to
##' \code{.GlobalEnv}, the objects will be assigned to variables in
##' the users global environment. This might be convienent for some,
##' but has the dangerous side effect of overwritting any existing
##' objects with the same names in the global environment.
##'
##' 
##' @title Extract Database Data
##' @param db_file character, the path to the database file to extract data from.
##' @param env an environment to store the tables from the database
##' @return environment, with one data.frame per table in the input database 
##' @author Matt Espe
##' @export
##' @examples
##' \dontrun{
##' # All data
##' detection_db = download_data(my_session)
##'
##' # One species
##' detection_db = dowloand(data(my_session, speciesID = 1)
##'
##' # defaults to putting tables in an environment
##' detection_data = extract_data(detection_db)
##'
##' # Access data via $
##' names(detection_data)
##' detection_data$Registrations
##' as.list(detection_data)
##' }
extract_data = function(db_file, env = new.env())
{
  db = dbConnect(RSQLite::SQLite(), db_file)
  on.exit(dbDisconnect(db))
  
  tbls = dbListTables(db)

  sapply(tbls, function(x) {
    tmp = dbGetQuery(db, sprintf("SELECT * FROM %s", x))
    tmp = fix_blobs(tmp)
    assign(x, tmp, envir = env)
  })
  
  env
}

fix_blobs = function(tbl)
  ## needed to convert the raw (binary) blobs in the payload slot to
  ## text
{
  i = sapply(tbl, function(x) inherits(x, "blob"))

  tbl[i] = lapply(tbl[i], function(r) {
    ans = character(length(r))
    j = is.na(r)
    ans[!j] = sapply(r[!j], rawToChar)
    ans
    })

  tbl

}
