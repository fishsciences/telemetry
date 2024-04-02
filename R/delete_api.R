delete_payload = function(end_pt, ...)
{

  dots = list(...)
  check_variables(dots, end_point) 

  switch(end_pt, 
         # programmatically taken from inst/parse_api_docs.R and then edited by hand
         "/api/admin/delete/affiliation" = list(deleteAffOID = c(unOID = dots$unOID), 
                                                deleteAffToken = c(unToken = dots$token), 
                                                deleteAffUID = c(unUID = dots$unUID)),
         "/api/admin/delete/batch" = list(deleteBatchReqID = c(unBatchID = dots$unBatchID),
                                          deleteBatchReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/network" = list(deleteNetReqID = c(unNetID = dots$unNetID), 
                                            deleteNetReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/org" = list(deleteOrgID = c(unOID = dots$unOID), 
                                        deleteOrgToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/project" = list(deleteProjReqID = c(unProjectID = dots$unProjectID), 
                                            deleteProjReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/species" = list(deleteSpecReqID = c(unSpecID = dots$unSpecID), 
                                            deleteSpecReqTok = c(unToken = dots$unToken)), 
         "/api/admin/delete/tech/antenna" = list(deleteAntTechID = c(unATID = dots$unATID), 
                                                 deleteAntTechToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/tech/compat" = list(deleteTechCompATID = c(unATID = dots$unATID), 
                                                deleteTechCompTTID = c(unTTID = dots$unTTID),
                                                deleteTechCompToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/tech/tag" = list(deleteTagTechID = c(unTTID = dots$unTTID), 
                                             deleteTagTechToken = c(unToken = dots$unToken)), 
         "/api/admin/delete/user" = list(deleteUserID = c(unUID = dots$unUID), 
                                         deleteUserToken = c(unToken = dots$unToken)),
         stop("Unknown end point"))
  
 }

