


start_session = function(uname, pwd,
                         api_url,
                         curl_handle,
                         ...)

{
  if(missing(curl_handle))
    curl_handle = getCurlHandle()
  payload = toJSON(list(loginName = list(unUserName = uname), loginPwd = pwd))
# browser()
  
  rsp =  getURL(url = api_url,
                httpheader = c("Content-Type" = "application/json"),
                postfields = payload,
                curl = curl_handle,
                ...)
                


  c(list(uname = uname,
         curl = curl_handle,
         start_time = Sys.time()),
       fromJSON(rsp))
                           

}


end_session = function(session, token = session$unToken,
                       curl_handle = session$curl,
                       api_url, ...)
{
  getURL(url = api_url,
         httpheader = c("Content-Type" = "application/json"),
         postfields = toJSON(list(unLogout = c(unToken = token))),
         curl = curl_handle,
         ...)

}
