if(file.exists("toy_credentials.R")){
  library(telemetry)
  library(tools)
  source("toy_credentials.R") # stores credentials - not committed

  a = start_session(usr, pwd, test_api, verbose = TRUE)

  # both region and species
  b = download_data(a, region = 3, speciesID = 1)

  c2 = extract_data(b)
  as.list(c2)

  # region only
  b = download_data(a, region = 3)

  c2 = extract_data(b)
  as.list(c2)
  nrow(c2$Registrations)

  # species only
  b = download_data(a, speciesID = 1)
  
  c2 = extract_data(b)
  as.list(c2)
  nrow(c2$Registrations)

  # should download everything
  b = download_data(a, verbose = TRUE)
  c = extract_data(b)
  as.list(c)

  # To compare to the above
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
