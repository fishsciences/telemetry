if(file.exists("toy_credentials.R")){
  library(telemetry)
  library(tools)
  source("tests/toy_credentials.R") # stores credentials - not committed

  a = start_session(usr, pwd, test_api, verbose = TRUE)

  assertError(download_data(a))

  b = download_data(a, region = 1, speciesID = 1)

  c = extract_data(b)
  as.list(c)
  c$AntennaTech$manifest ## What is this? blob??

  if(FALSE){
  ## pull down all data from toy dataset
  x = expand.grid(region = 1:10, speciesID = 1:5)

  dbs = mapply(function(r, s) download_data(a,region = r, speciesID = s),
               r = x$region, s = x$speciesID)
  
  all_data = lapply(dbs, extract_data)
  all_data = lapply(all_data, as.list)

  sapply(all_data, function(x) nrow(x$Tags))
  sapply(all_data, function(x) nrow(x$Registrations))
  }

  end_session(a, api_baseurl = test_api)
  assertError(download_data(a, region = 1, speciesID = 1))
  
}
