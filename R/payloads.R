##' This function creates a nested list in the correct structure to be
##' converted to JSON and delivered to the API
##'
##' @title Create API Data Payload
##' @param end_pt character, the name of the API end point to create a payload for
##' @param ... key = value pairs for creating the JSON payload
##' @return list 
##' @author Matt Espe
##' @export
create_payload = function(end_pt, ...)
{

  dots = list(...)
  check_variables(dots, end_pt) 

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
             # Not sure if this will work
             dots$antData, 
             createNetReqName = c(unNetName = dots$unNetName), 
             createNetReqOrg = c(unOID = dots$unOID),
             createNetReqTok = c(unToken = dots$unToken))), 
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
         "/api/list/affiliations" = list(
           affReqTok = c(unToken = dots$unToken), 
           affReqUID = c(unUID = dots$unUID)),
         "/api/list/batches" = list(
           batchReqProj = c(unProjectID = dots$unProjectID),
           batchReqTok = c(unToken = dots$unToken)), 
         "/api/list/networks" = list(
           netReqTok = c(unToken = dots$unToken)), 
         "/api/list/orgs" = list(
           orgReqTok = c(unToken = dots$unToken)), 
         "/api/list/projects" = list(
           projReqTok = c(unToken = dots$unToken)), 
         "/api/list/species" = list(
           specReqTok = c(unToken = dots$unToken)), 
         "/api/list/tech/antenna" = list(
           antTechReqTok = c(unToken = dots$unToken)), 
         "/api/list/tech/compat/antenna" = list(
           antCompReqTTID = c(unATID = dots$unATID), 
           antCompReqTok = c(unToken = dots$unToken)), 
         "/api/list/tech/compat/tag" = list(
           tagCompReqTTID = c(unTTID = dots$unTTID), 
           tagCompReqTok = c(unToken = dots$unToken)), 
         "/api/list/tech/tag" = list(
           tagTechReqTok = c(unToken = dots$unToken)), 
         "/api/list/users" = list(
           userReqOrg = c(unOID = dots$unOID),
           userReqTok = c(unToken = dots$unToken))
         stop("Unknown end point"))
}

##' Creates a nested list from an data.frame to be suitable for
##' submission to the API
##'
##' @title Create Antenna Data
##' @param df data.frame
##' @param req_cols character vector, the names of the columns required to be in the df
##' @return nested list for conversion into JSON 
##' @author Matt Espe
##' @export
create_antData = function(df,
                          req_cols = c("unATID", "antDataEnd",
                                       "unLat", "unLong", "unAntName",
                                       "unRegion", "antDataStart"))
{
  
  if(!all(req_cols %in% colnames(df)))
    stop("Missing columns in data.frame: ",
         paste(setdiff(req_cols,
                       colnames(df)), collapse = ", "))
  
  ## Check the df here for data types?
  lapply(seq(nrow(df)), function(i) create_one_ant(df[i,]))
}

create_one_ant = function(df)
{
  list(antDataATID = c(unATID = df$unATID),
       antDataEnd = df$antDataEnd, 
       antDataLat = c(unLat = df$unLat),
       antDataLong = c(unLong = df$unLong), 
       antDataName = c(unAntName = df$unAntName),
       antDataRegi = c(unRegion = df$unRegion), 
       antDataStart = df$antDataStart)
}


