if(file.exists("toy_credentials.R")){
  library(telemetry)
  library(tools)
  source("toy_credentials.R") # stores credentials - not committed

  a = start_session(usr, pwd, test_api, verbose = TRUE)

  # Rely on data object, not API
  list_endpoint_variable()
  list_endpoints()
  list_endpoint_variable("/api/admin/create/user")

  list_db_entry("users", 1, a)
  list_db_entry("users", 2, a)
  
  telemetry:::create_entry(a, createUserInfo = "nothing here", unUserName = "Matt", createUserPass = "qwerty", unToken = a$unToken, end_point = "/api/admin/create/user")

  list_endpoint_variable("/api/admin/create/affiliation")

  telemetry:::create_entry(a, unOID = 2, unUID = 3, unToken = a$unToken, end_point = "/api/admin/create/affiliation")

  list_db_entry("users", 2, a) # No affiliation yet, so doesn't show up in users? WTAF

  list_db_entry("affiliations", 2, session = a)
  list_db_entry("orgs", session = a)


  b = start_session("Matt", "qwerty", test_api, verbose = TRUE)
  list_db_entry("orgs", session = b)
