# Generic for create* endpoints

##' This is a flexible function for interacting with any of the
##' numerous /api/admin/create/* endpoints. It functions by taking key
##' = value pairs required for each of the endpoints and crafting the
##' appropriate JSON payload to submit to the server.
##'
##' There are some particularities around how the database expects
##' some elements to be created. See the vignette
##' "Telemetry API Administration" for details.
##'
##' 
##' @title Create Database Entry
##' @param session list, and active session object created by \code{start_session()}
##' @param ... key = value pairs of parameters for each end point
##'   request. These vary by endpoint. For a list of the required
##'   variables for each end point, use
##'   \code{list_endpoint_variable()}
##' @param end_point chracter, the end point for the API
##' @param token character, the unToken for an active session
##' @param curl_handle an existing curl handle for an active
##'   session. If not provided, one will be created just for this
##'   call.
##' @param api_baseurl character, the base URL for the API
##' @param api_url character, the full URL to the endpoint
##' @return json result
##' @author Matt Espe
##' @export
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
                   "/api/admin/create/affiliation" = affiliation_create_pl(dots),
                   "/api/admin/create/batch" = stop("Batch not implemented yet"), 
                   "/api/admin/create/network" = stop("Network not implemented yet"),
                   "/api/admin/create/org" = org_create_pl(dots),
                   "/api/admin/create/project" = project_create_pl(dots), 
                   "/api/admin/create/species" = species_create_pl(dots),
                   "/api/admin/create/tech/antenna" = tech_antenna_create_pl(dots), 
                   "/api/admin/create/tech/compat" = tech_compat_create_pl(dots),
                   "/api/admin/create/tech/tag" = tech_tag_create_pl(dots), 
                   "/api/admin/create/user" = user_create_pl(dots))

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

##' Convienence functions to list and check the variables for each API
##' endpoint.
##'
##' @title Check Endpoint Variables
##' @param x named vector of variables, where the names are the
##'   variable names, and the values are the value to assign to that
##'   variable
##' @param end_pt character, the name of the end point
##' @return variable names, endpoint names, or NULL 
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




create_payload = function(end_pt, ...)
{

  dots = list(...)
  ## Pulled out of the docs.md programmatically and then edited by
  ## hand
  switch(end_pt, 
         "/api/admin/create/affiliation" = list(
           createAffOID = c(unOID = dots$unOID), 
           createAffToken = c(unToken = dots$unToken), 
           createAffUID = c(unUID = dots$unUID)),
         "/api/admin/create/batch" = list(
           createBatchReqData = list(
             batchDataProject = c(unProjectID = dots$UnProjectID), 
             batchDataSchema = list(fields = dots$fields,
                                    units = dots$units),
             batchDataSpecies = c(unSpecID = dots$unSpecID), 
             batchDataTech = c(unTTID = dots$unTTID)),
           createBatchReqTags = list(
             list(tagDataName = c(unTagName = dots$unTagName), 
           tagDataPayload = dots$tagDataPayload,
           tagDataTime = dots$tagDataTime)), 
           createBatchReqTok = c(unToken = dots$unToken)), 
         "/api/admin/create/network" = list(
           createNetReqAnts = list(
             # These antenna creation bits need to be moved to a separate function
             list(antDataATID = c(unATID = dots$unATID),
                  antDataEnd = dots$antDataEnd, 
                  antDataLat = c(unLat = dots$unLat),
                  antDataLong = c(unLong = dots$unLong), 
                  antDataName = c(unAntName = dots$unAntName),
                  antDataRegi = c(unRegion = dots$unRegion), 
                  antDataStart = dots$antDataStart), 
             list(antDataATID = c(unATID = dots$unATID),
                  antDataEnd = dots$antDataEnd, 
                  antDataLat = c(unLat = dots$unLa),
                  antDataLong = c(unLong = dots$unLong), 
                  antDataName = c(unAntName = dots$unAntName),
                  antDataRegi = c(unRegion = dots$unRegion), 
                  antDataStart = dots$andDataStart)), 
           createNetReqName = c(unNetName = dots$unNetName), 
           createNetReqOrg = c(unOID = dots$unOID),
           createNetReqTok = c(unToken = dots$unToken)), 
         "/api/admin/create/org" = list(
           createOrgInfo = dots$createOrgInfo,
           createOrgName = c(unOrgName = dots$unOrgName),
           createOrgToken = c(unToken = dots$unToken)), 
         "/api/admin/create/project" = list(
           createProjReqDesc = dots$createProjReqDesc, 
           createProjReqName = c(unProjName = dots$unProjName), 
           createProjReqOrg = c(unOID = dots$unOID),
           createProjReqTok = c(unToken = dots$unToken)), 
         "/api/admin/create/species" = list(
           createSpecReqName = c(unSpecName = dots$unSpecName), 
           createSpecReqTok = c(unToken = dots$unToken)), 
         "/api/admin/create/tech/antenna" = list(
           createAntTechMan = list(
             unATMan = list(
               freqUnit = dots$freqUnit,
               frequency = dots$frequency,
               range = dots$range, 
               rangeUnit = dots$rangeUnit)),
           createAntTechName = c(unATName = dots$unATName), 
           createAntTechToken = c(unToken = dots$unToken)), 
         "/api/admin/create/tech/compat" = list(
           createTechCompATID = c(unATID = dots$unATID), 
           createTechCompTTID = c(unTTID = dots$unTTID),
           createTechCompToken = c(unToken = dots$unToken)), 
         "/api/admin/create/tech/tag" = list(
           createTagTechMan = list(
             unTTMan = list(dataFields = dots$dataFields,
                            dataUnits = dots$dataUnits, 
                            info = dots$info),
             createTagTechName = c(unTTName = dots$unTTName), 
             createTagTechToken = c(unToken = dots$unToken))), 
         "/api/admin/create/user" = list(
           createUserInfo = dots$createUserInfo, 
           createUserName = c(unUserName = dots$createUserName),
           createUserPass = dots$createUserPass, 
           createUserToken = c(unToken = dots$unToken)),
         "/api/admin/delete/affiliation" = list(
           deleteAffOID = c(unOID = dots$unOID), 
           deleteAffToken = c(unToken = dots$token), 
           deleteAffUID = c(unUID = dots$unUID)),
         "/api/admin/delete/batch" = list(
           deleteBatchReqID = c(unBatchID = dots$unBatchID),
           deleteBatchReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/network" = list(
           deleteNetReqID = c(unNetID = dots$unNetID), 
           deleteNetReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/org" = list(
           deleteOrgID = c(unOID = dots$unOID), 
           deleteOrgToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/project" = list(
           deleteProjReqID = c(unProjectID = dots$unProjectID), 
           deleteProjReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/species" = list(
           deleteSpecReqID = c(unSpecID = dots$unSpecID), 
           deleteSpecReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/tech/antenna" = list(
           deleteAntTechID = c(unATID = dots$unATID), 
           deleteAntTechToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/tech/compat" = list(
           deleteTechCompATID = c(unATID = dots$unATID), 
           deleteTechCompTTID = c(unTTID = dots$unTTID),
           deleteTechCompToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/tech/tag" = list(
           deleteTagTechID = c(unTTID = dots$unTTID), 
           deleteTagTechToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/user" = list(
           deleteUserID = c(unUID = dots$unUID), 
           deleteUserToken = c(unToken = dots$unToken)),
         stop("Unknown end point"))
  
}


## Hacky way to construct the payloads. The list structure was
## extracted from the doc.md file in inst/parse_api_docs.R
affiliation_create_pl = function(dots)
{
  list(createAffOID = c(unOID = dots$unOID),
       createAffToken = c(unToken = dots$unToken),
       createAffUID = c(unUID = dots$unUID))
}

org_create_pl = function(dots)
{
  list(createOrgInfo = dots$createOrgInfo,
       createOrgName = c(unOrgName = dots$unOrgName),
       createOrgToken = c(unToken = dots$unToken))
}

project_create_pl = function(dots)
{
  list(createProjReqDesc = dots$createProjReqDesc,
       createProjReqName = c(unProjName = dots$unProjName),
       createProjReqTok = c(unToken = dots$unToken))
}

species_create_pl = function(dots)
{
  list(createSpecReqName = c(unSpecName = dots$unSpecName),
       createSpecReqTok = c(unToken = dots$unToken))
}

tech_antenna_create_pl = function(dots)
{
  list(createAntTechMan = list(unATMan =
                                 list(freqUnit = dots$freqUnit,
                                      frequency = dots$frequency,
                                      range = dots$range,
                                      rangeUnit = dots$rangeUnit)),
       createAntTechName = c(unATName = dots$unATName),
       createAntTechToken = c(unToken = dots$unToken))
}

tech_compat_create_pl = function(dots)
{
  list(createTechCompATID = c(unATID = dots$unATID), 
       createTechCompTTID = c(unTTID = dots$unTTID),
       createTechCompToken = c(unToken = dots$unToken))
}

tech_tag_create_pl = function(dots)
{
  list(createTagTechMan = list(
    unTTMan = list(
      dataFields = dots$dataFields,
      dataUnits = dots$dataUnits, 
      info = dots$info)),
    createTagTechName = c(unTTName = dots$unTTName), 
    createTagTechToken = c(unToken = dots$unToken))
}

user_create_pl = function(dots)
{
  list(createUserInfo = dots$createUserInfo, 
       createUserName = c(unUserName = dots$unUserName),
       createUserPass = dots$createUserPass, 
       createUserToken = c(unToken = dots$unToken))
}
