if(file.exists("toy_credentials.R")){
  source("tests/toy_credentials.R") # stores credentials - not committed

  a = start_session(usr, pwd, test_api, verbose = TRUE)

  end_session(a, api_baseurl = test_api)
  
  }
