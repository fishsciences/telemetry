
##' This is a flexible function for interacting with any of the
##' numerous /api/* endpoints. It functions by taking key = value
##' pairs required for each of the endpoints and crafting the
##' appropriate JSON payload to submit to the server. All end points
##' require a "unToken" to authorize the request - if this is not
##' provided in the key = value pairs, it will automatically be picked
##' up from the "token" parameter, which defaults to the "unToken"
##' element in the session object.
##'
##' There are some particularities around how the database expects
##' some elements to be created. See the vignette
##' "Telemetry API Administration" for details.
##'
##'
##' For /api/create/network and /api/create/batch, the antenna and tag
##' data must first be coerced into the proper format (a nested list) via
##' \code{create_antenna_data()} and \code{create_batch_tag_data()},
##' respectively.
##' 
##' @title Send Database API request
##' @param session list, and active session object created by
##'   \code{start_session()}
##' @param ... key = value pairs of parameters for each end point
##'   request. These vary by endpoint. For a list of the required
##'   variables for each end point, use
##'   \code{list_endpoint_variable()}. See details for more
##'   information.
##' @param end_point chracter, the end point for the API
##' @param token character, the unToken for an active session
##' @param curl_handle an existing curl handle for an active
##'   session. If not provided, one will be created just for this
##'   call.
##' @param api_baseurl character, the base URL for the API
##' @param api_url character, the full URL to the endpoint
##' @param .curlOpts additional arguments passed to
##'   \code{RCurl::getURL()}
##' @param simplify logical, whether the result should be coerced to a
##'   data.frame. Most often useful for the /api/list/* endpoints
##' @param confirm_delete logical, confirm when the endpoint is one of
##'   /api/admin/delete/*. Defaults to FALSE, which will require
##'   interactive confirmation to proceed. For non-interactive
##'   sessions, this must be set to TRUE to complete a delete
##'   operation.
##' @param debug_json logial, if TRUE the function returns the JSON
##'   payload as a string and does not send the request. This is
##'   primarily for debugging API behavior and checking the JSON
##'   payloads for correctness. The JSON will include white space for
##'   pretty printing, e.g. \code{cat(payload)}
##' @return json or data.frame result (depending on value of
##'   \code{simplify}, or if \code{debug_json = TRUE} the JSON
##'   payload.
##' @author Matt Espe
##' @export
##' @examples
##' \dontrun{
##' send_api_request(my_session,
##'                 createUserInfo = "nothing here",
##'                 unUserName = "Matt",
##'                 createUserPass = "qwerty",
##'                 unToken = my_session$unToken,
##'                 end_point = "/api/admin/create/user")                 
##'
##' }
send_api_request = function(session,
                            ...,
                            end_point,
                            token = session$unToken,
                            curl_handle = session$curl,
                            api_baseurl = session$base_url,
                            api_url = paste0(api_baseurl, end_point),
                            .curlOpts = list(),
                            simplify = grepl("list", end_point),
                            confirm_delete = FALSE,
                            debug_json = FALSE)
{
  if(length(end_point) != 1) stop("Please specify a single end_point")

  if(grepl("delete", end_point) && !confirm_delete){
    if(!interactive())
      stop("To use a delete operation in a non-interactive session, please set `confirm_delete` to TRUE")
    
    cont = askYesNo("Delete operations require confirmation!\n This operation cannot be undone!\n Continue?",
                    default = FALSE)
    if(!isTRUE(cont)) stop("Delete operation canceled.")
  }
  
  if(!"unToken" %in% ...names()) {
    payload = create_payload(..., unToken = token, end_pt = end_point)
   }else {
    payload = create_payload(..., end_pt = end_point)
  }

  if(debug_json)
    return(toJSON(payload))
           
  h = basicHeaderGatherer()

  rsp = getURL(url = api_url,
               httpheader = c("Content-Type" = "application/json"),
               postfields = toJSON(payload),
               headerfunction = h$update,
               curl = curl_handle,
               .opts = .curlOpts)

  # handle errors here
  if(h$value()["status"] != "200")
    stop(h$value()["status"], ": ", h$value()["statusMessage"],
         "\n", rsp)

  if(simplify)
    return(as.data.frame(do.call(rbind, fromJSON(rsp))))
    
  fromJSON(rsp)
}



##' @rdname check_variables
##' @export
##' @examples
##' list_endpoints()
list_endpoints = function()
{
  names(api_variable_names)
}

##' @rdname check_variables
##' @export
##' @examples
##' list_endpoint_variable("/api/admin/create/user")
list_endpoint_variable = function(end_pt = c())
{
  if(length(end_pt) > 0 && !all(end_pt %in% names(api_variable_names)))
    stop("End point not recognized - please check provided end point against `list_endpoints()`")
  
  api_variable_names[end_pt]    
}


