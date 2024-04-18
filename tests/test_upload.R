if(file.exists("toy_credentials.R")){
  library(telemetry)
  library(tools)
  source("toy_credentials.R") # stores credentials - not committed

  a = start_session(usr, pwd, test_api, verbose = TRUE)
  
  reg_data = data.frame(unAntName = "NATO-StanNetwork-1",
                        unTagName = 99999,
                        regDataTime = format(Sys.time(), "%FT%T%z"),
                        temp = 39.0,
                        test2 = 2)

  telemetry:::create_registration_data(reg_data, c("temp", "test2"))

  api_upload_data(a, reg_data, c("temp"))

  ## check for new det
  b = download_data(a)

  c = as.list(extract_data(b))
  sort(c$Registrations$time)
  
}
