if(file.exists("toy_credentials.R")){
  library(telemetry)
  library(tools)
  source("toy_credentials.R") # stores credentials - not committed

  a = start_session(usr, pwd, test_api, verbose = TRUE)

  # Rely on data object, not API
  list_endpoint_variable()
  list_endpoints()
  list_endpoint_variable("/api/admin/create/user")

  # alternatives
  send_api_request(a,
                   end_point = "/api/list/users",
                   unOID = 1,
                   unToken = a$unToken)

  send_api_request(a,
                   end_point = "/api/list/users",
                   unOID = 4, simplify = FALSE)

  send_api_request(a,
                   end_point = "/api/list/affiliations",
                   unUID = 10)
  
  list_db_entry("users", 1, a)
  list_db_entry("users", 2, a)
  list_db_entry("users", 3, a)
  
  list_db_entry("affiliations", 2, a)
  
  send_api_request(a,
                   createUserInfo = "nothing here",
                   unUserName = "Matt",
                   createUserPass = "qwerty",
                   unToken = a$unToken,
                   end_point = "/api/admin/create/user")

  list_endpoint_variable("/api/admin/create/affiliation")

  # add user above to an existing affiliation
  send_api_request(a,
                   unOID = 1,
                   unUID = 3,
                   unToken = a$unToken,
                   end_point = "/api/admin/create/affiliation")

  list_db_entry("users", 2, a) 
  list_db_entry("users", 1, a) 

  list_db_entry("affiliations", 6, session = a)

  list_db_entry("orgs", session = a)

  list_endpoint_variable("/api/admin/delete/user")

  send_api_request(a,
                   unUID = 10,
                   unToken = a$unToken,
                   end_point = "/api/admin/delete/user")

  # User is gone
  list_db_entry("users", 2, a) 
  list_db_entry("users", 1, a) 

  # create new user with different name
  send_api_request(a,
                   createUserInfo = "nothing here",
                   unUserName = "Matt3",
                   createUserPass = "qwerty",
                   unToken = a$unToken,
                   end_point = "/api/admin/create/user")

  # New user inherited old affiliations!
  list_db_entry("users", 2, a)
  
  b = start_session("Matt", "qwerty", test_api, verbose = TRUE)

  list_db_entry("orgs", session = b)

  send_api_request(b,
                   unUID = 10,
                   unToken = b$unToken,
                   end_point = "/api/admin/delete/user")

  list_endpoint_variable("/api/admin/create/org")

  send_api_request(b,
                   end_point = "/api/admin/create/org",
                   createOrgInfo = "Bob's fish",
                   unOrgName = "Bob's fishery science",
                   unToken = b$unToken)

  send_api_request(b,
                   unOID = 0,
                   unUID = 6,
                   unToken = b$unToken,
                   end_point = "/api/admin/create/affiliation")

  list_db_entry("users", 2, a)

  # Not affiliated with NATO - should not get tagged data
  c = start_session("Matt3", "qwerty", test_api, verbose = TRUE)

  d1 = download_data(c, speciesID = 1)
  as.list(extract_data(d1)) ## correct - does not return registered tags
  d2 = download_data(c, verbose = TRUE)
  tmp = extract_data(d2) # Correct - returns unregistered tags

  d1 = download_data(b, speciesID = 1)
  as.list(extract_data(d1)) 
  d2 = download_data(a, verbose = TRUE)
  tmp2 = extract_data(d2)

  # What happens when someone sends a full paragraph 
  send_api_request(b,
                   end_point = "/api/admin/create/org",
                   createOrgInfo = paste(sample(letters, 1e4, replace = TRUE), collapse = ""),
                   unOrgName = "Test",
                   unToken = b$unToken)

  list_endpoint_variable("/api/admin/delete/org")

  send_api_request(b,
                   end_point = "/api/admin/delete/org",
                   unOID = 4,
                   unToken = b$unToken)

}
