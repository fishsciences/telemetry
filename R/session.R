


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
                     verbose = TRUE)


  c(list(uname = uname,
         curl = curl_handle,
         start_time = Sys.time()),
       fromJSON(rsp))
                           

}

