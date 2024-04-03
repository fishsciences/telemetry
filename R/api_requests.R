
##' This is a flexible function for interacting with any of the
##' numerous /api/* endpoints. It functions by taking key
##' = value pairs required for each of the endpoints and crafting the
##' appropriate JSON payload to submit to the server.
##'
##' There are some particularities around how the database expects
##' some elements to be created. See the vignette
##' "Telemetry API Administration" for details.
##'
##' 
##' @title Send Database API request
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
send_api_request = function(session,
                            ...,
                            end_point,
                            token = session$unToken,
                            curl_handle = session$curl,
                            api_baseurl = session$base_url,
                            api_url = paste0(api_baseurl, end_point),
                            .curlOpts)
{
  
  payload = create_payload(..., end_point)
  
  h = basicHeaderGatherer()

  rsp = getURL(url = api_url,
               httpheader = c("Content-Type" = "application/json"),
               postfields = toJSON(payload),
               headerfunction = h$update,
               curl = curl_handle,
               .opts = .curlOpts)
    # handle errors here
  if(h$value()["status"] != "200")
    stop(h$value()["status"], ": ", h$value()["statusMessage"])

  fromJSON(rsp)
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


