

##' Login to the database server using pre-established login
##' credentials. This will return a token for the session, which is
##' used in all subsequent calls the the API.
##'
##'
##' Best practices are to avoid storing your password in Rscripts that
##' might be shared. To avoid doing this, you can set the credentials
##' in a separate file, and read that file into R to set the login
##' credentials.
##' 
##' @title Start Database Session
##' @param uname character
##' @param pwd character. See notes for best practices
##' @param api_baseurl character, the base URL for the database server
##' @param end_point character, the API end point for the login
##' @param api_url character, the URL for the database server login
##' @param curl_handle a curl handle created by
##'     \code{getCurlHandle()}. If one is not provided, it will be
##'     created. Please note, it is best practice to establish a curl
##'     handle when interacting with an API
##' @param ... additional arguments passed to \code{RCurl::getURL()}}
##' @return list
##' @author Matt Espe
##' @export
start_session = function(uname, pwd,
                       api_baseurl,
                       end_point = "/api/auth/login",
                       api_url = paste0(api_baseurl, end_point),
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

##' Ends the session for an certain token.
##'
##' 
##' @title End Database Session
##' @param session a list object created via \code{create_session()}
##' @param token character, a session token, 
##' @param curl_handle a curl handle created by
##'     \code{getCurlHandle()}. If one is not provided, it will be
##'     created. Please note, it is best practice to establish a curl
##'     handle when interacting with an API
##' @param api_baseurl character, the base URL for the database server
##' @param end_point character, the API end point for the login
##' @param api_url character, the URL for the database server login
##' @param ... additional arguments passed to \code{RCurl::getURL()}}
##' @param uname character
##' @param pwd character. See notes for best practices
##' @return  NULL
##' @author Matt Espe
##' @export
end_session = function(session, token = session$unToken,
                       curl_handle = session$curl,
                       api_baseurl,
                       end_point = "/api/auth/logout",
                       api_url = paste0(api_baseurl, end_point),
                       ...)
{

    getURL(url = api_url,
           httpheader = c("Content-Type" = "application/json"),
           postfields = toJSON(list(unLogout = c(unToken = token))),
           curl = curl_handle,
           ...)
    return(invisible(NULL))
}

