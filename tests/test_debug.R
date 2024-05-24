library(telemetry)

# bad tests, but work without a connection to the database
ans = send_api_request("m", unOID = 1, unToken = "b", end_point = "/api/list/users", debug_json = TRUE)

stopifnot(inherits(ans, "character"))

ans2 = api_upload_data("m", token = "b",
                       data.frame(unAntName = "b", unTagName = "a",
                                  regDataTime = "2022-01-01",
                                  temp = 1),
                       other_data_column_names = "temp",
                       debug_json = TRUE)

stopifnot(inherits(ans2, "character"))

ans3 = download_data("m", token = "m", debug_json = TRUE)
stopifnot(inherits(ans3, "character"))
