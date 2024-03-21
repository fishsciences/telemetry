# Generic for create* endpoints

create_entry = function(session,
                        ...,
                        end_point,
                        token = session$unToken,
                        curl_handle = session$curl,
                        api_baseurl = session$base_url,
                        api_url = paste0(api_baseurl, end_point))
{
  dots = list(...)
  check_variables(dots, end_point) 

  payload = switch(end_point,
                   "/api/admin/create/affiliation" = affiliation_payload(dots),
                   "/api/admin/create/batch" = stop("Batch not implemented yet"), 
                   "/api/admin/create/network" = stop("Network not implemented yet"),
                   "/api/admin/create/org" = org_payload(dots),
                   "/api/admin/create/project" = project_payload(dots), 
                   "/api/admin/create/species" = species_payload(dots),
                   "/api/admin/create/tech/antenna" = tech_antenna_payload(dots), 
                   "/api/admin/create/tech/compat" = tech_compat_payload(dots),
                   "/api/admin/create/tech/tag" = tech_tag_payload(dots), 
                   "/api/admin/create/user" = user_payload(dots))

  h = basicHeaderGatherer()

  rsp = getURL(url = api_url,
               httpheader = c("Content-Type" = "application/json"),
               postfields = toJSON(payload),
               headerfunction = h$update,
               curl = curl_handle,
               ...)
    # handle errors here
  if(h$value()["status"] != "200")
    stop(h$value()["status"], ": ", h$value()["statusMessage"])

  rsp
}

##' .. content for \description{} (no empty lines) ..
##'
##' @title Check Endpoint Variables
##' @param x named vector of variables, where the names are the
##'   variable names, and the values are the value to assign to that
##'   variable
##' @param end_pt character, the name of the end point
##' @return 
##' @author Matt Espe
##' @export
check_variables = function(x, end_pt)
{
  tmp = api_variable_names[[end_pt]]
  d = setdiff(names(x), tmp)
  if(length(d) != 0)
    stop("Check provided `...` for proper end-point variable names")
  return(invisible(NULL))
}


##' @rdname check_variables
##' @export
list_endpoints = function()
{
  names(api_variable_names)
}

##' @rdname check_variables
##' @export
list_endpoint_variable = function(end_pt = c())
{
  if(length(end_pt) > 0 && !all(end_pt %in% names(api_variable_names)))
    stop("End point not recognized - please check provided end point against `list_endpoints()`")

  api_variable_names[end_pt]    
}


## Hacky way to construct the payloads. The list structure was
## extracted from the doc.md file in inst/parse_api_docs.R
affiliation_payload = function(dots)
{
  list(createAFFOID = c(unOID = dots$unOID),
       createAffToken = c(unToken = dots$unToken),
       createAffUID = c(unUID = dots$unUID))
}

org_payload = function(dots)
{
  list(createOrgInfo = dots$createOrgInfo,
       createOrgName = c(unOrgName = dots$unOrgName),
       createOrgToken = c(unToken = dots$unToken))
}

project_payload = function(dots)
{
  list(createProjReqDesc = dots$createProjReqDesc,
       createProjReqName = c(unProjName = dots$unProjName),
       createProjReqTok = c(unToken = dots$unToken))
}

species_payload = function(dots)
{
  list(createSpecReqName = c(unSpecName = dots$unSpecName),
       createSpecReqTok = c(unToken = dots$unToken))
}

tech_antenna_payload = function(dots)
{
  list(createAntTechMan = list(unATMan =
                                 list(freqUnit = dots$freqUnit,
                                      frequency = dots$frequency,
                                      range = dots$range,
                                      rangeUnit = dots$rangeUnit)),
       createAntTechName = c(unATName = dots$unATName),
       createAntTechToken = c(unToken = dots$unToken))
}

tech_compat = function(dots)
{
  list(createTechCompATID = c(unATID = dots$unATID), 
       createTechCompTTID = c(unTTID = dots$unTTID),
       createTechCompToken = c(unToken = dots$unToken))
}

tech_tag = function(dots)
{
  list(createTagTechMan = list(
    unTTMan = list(
      dataFields = dots$dataFields,
      dataUnits = dots$dataUnits, 
      info = dots$info)),
    createTagTechName = c(unTTName = dots$unTTName), 
    createTagTechToken = c(unToken = dots$unToken))
}

user_payload = function(dots)
{
  list(createUserInfo = dots$createUserInfo, 
       createUserName = c(unUserName = dots$createUserName),
       createUserPass = dots$UserPass, 
       createUserToken = c(unToken = dots$unToken))
}
