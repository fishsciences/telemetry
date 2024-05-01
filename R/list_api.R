## functions for listing in the database

##' A generic function for accessing all /api/list/* end-points.
##'
##' 
##' @title List DB entry
##' @param entry character, one of affiliations, batches, projects, networks, orgs, species, antenna
##' @param additionalID optional, for end-points that require an additional identifier
##' @param session list, an object created by \code{start_session()}
##' @param token the token for the session
##' @param curl_handle curl handle for making requests
##' @param api_baseurl character, the base URL for the database 
##' @param end_point character, the suffix for the end-point being queried
##' @param api_url character, the full url for the end-point
##' @param ... additional arguments passed to \code{getURL()}
##' @return data.frame of the available categories for each request 
##' @author Matt Espe
##' @export
list_db_entry = function(entry, additionalID = NA,
                         session,
                         token = session$unToken,
                         curl_handle = session$curl,
                         api_baseurl = session$base_url,
                         end_point = "/api/list/",
                         api_url = paste0(api_baseurl, end_point),
                         ...)
{
  warning("list_db_entry() is deprecated. Please use send_api_request() instead.")
  
  if(length(entry) > 1)
    stop("Please provide only one `entry` at a time.")
  
  i = match(entry, names(token_names))
  if(is.na(i))
    stop("Provided `entry` does not line-up with an API end-point. Must be one of:\n", paste(names(token_names), collapse = ", "))

  api_url = paste0(api_url, names(token_names)[i])
  ## browser()
  payload = list()
  
  payload[[token_names[[i]]]]$unToken = token

  j = match(entry, names(token_names2))

  if(!is.na(j)){
    nms = token_names2[[j]]
    
    if(is.na(additionalID))
      stop("Provided `entry` requires `additionalID` of ", nms)

    payload[[nms[[1]]]][[nms[[2]]]] = additionalID
  }          
  h = basicHeaderGatherer()
  
  rsp = getURL(url = api_url,
              httpheader = c("Content-Type" = "application/json"),
              postfields = toJSON(payload),
              curl = curl_handle,
              headerfunction = h$update,
              ...)
  
  # handle errors here
  if(h$value()["status"] != "200")
    stop(h$value()["status"], ": ", h$value()["statusMessage"])

  as.data.frame(do.call(rbind, fromJSON(rsp)))
}

##' A convenience function for returning the full endpoint name from a
##' partial (short) name.
##'
##' @title Get Full Endpoint Name
##' @param endpoint_shortname character, the short name to match
##' @param endpoint_fullnames character vector, the full names of the
##'   endpoints to match to
##' @return character, the matched full name of the endpoint
##' @author Matt Espe
##' @export
get_full_endpoint = function(endpoint_shortname,
                             endpoint_fullnames = names(api_variable_names))
{
  # Escape 
  sn = gsub("/", "\\\\/", endpoint_shortname)
  i = grep(sn, endpoint_fullnames)
  if(length(i) == 0)
    stop("No endpoint matched from shortname!\n",
         "Please check list of valid API endpoints")
  
  if(length(i) > 1)
    warning("Multiple endpoints match `endpoint_shortname`\n",
            "Please include additional path to narrow to a single endpoint")

  endpoint_fullnames[i]
}

token_names = list(affiliations = "affReqTok",
                   batches = "batchReqTok",
                   projects = "projReqTok",
                   networks = "netReqTok",
                   orgs = "orgReqTok",
                   species = "specReqTok",
                   "tech/antenna" = "antReqTok",
                   "tech/compat/antenna" = "antCompReqTok",
                   "tech/compat/tag" = "tagCompReqTok",
                   "tech/tag" = "tagTechReqTok",
                   users = "userReqTok")
     
token_names2 = list(affiliations = c("affReqUID", "unUID"),
                    batches = c("batchReqProj", "unProjectID"),
                    users = c("userReqOrg", "unOID"),
                    "tech/compat/antenna" = c("antCompReqTTID", "unATID"),
                    "tech/compat/tag" = c("tagCompReqTTID", "unTTID"))
     
     
