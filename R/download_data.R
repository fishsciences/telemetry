download_data = function(session,
                         region,
                         speciesID,
                         token = session$unToken,
                         curl_handle = session$curl,
                         api_baseurl,
                         end_point = "/api/data/download",
                         api_url = paste0(api_baseurl, end_point),
                         ...)
{
  
  payload = toJSON(
    list(downReqSpec = list(
      downloadRegion = c(unRegion = region),
      downloadSpeciesID = c(unSpecID = speciesID)),
      downReqTok = c(unToken = token)))
  
  browser()
  
    rsp =  getURL(url = api_url,
                  httpheader = c("Content-Type" = "application/json"),
                  postfields = payload,
                  ## curl = curl_handle,
                  file = "test.sqlite",
                  ...)

}

