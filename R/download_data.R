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
  
  payload = toJSON(
    list(downReqSpec = list(
      downloadRegion = c(unRegion = region),
      downloadSpeciesID = c(unSpecID = speciesID)),
      downReqTok = c(unToken = token)))
  
  ## browser()
  
    rsp = getBinaryURL(url = api_url,
                 httpheader = c("Content-Type" = "application/json"),
                 postfields = payload,
                 ## curl = curl_handle,
                 ...)
  # handle errors here
  if(rawToChar(rsp[1:5]) == "Error")
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
extract_data = function(db_file, env = new.env())
{
  db = dbConnect(RSQLite::SQLite(), db_file)
  on.exit(dbDisconnect(db))
  
  tbls = dbListTables(db)

  sapply(tbls, function(x) {
    tmp = dbGetQuery(db, sprintf("SELECT * FROM %s", x))
    assign(x, tmp, envir = env)
  })

  env
}
