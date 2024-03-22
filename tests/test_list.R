if(file.exists("toy_credentials.R")){

library(telemetry)
  library(tools)
  source("toy_credentials.R") # stores credentials - not committed
  a = start_session(usr, pwd, test_api, verbose = TRUE)

  list_db_entry("orgs", session = a)
  assertError(list_db_entry("users", session = a))
  list_db_entry("users", 1, session = a)
  list_db_entry("species", session = a)
}
