library(telemetry)
d = readRDS(system.file(package = "telemetry", "ac_test.rds")) |>
  dplyr::select(Transmitter, StationName, DateTimeUTC) |>
  tag_tales(TagID_col = "Transmitter", Station_col = "StationName", "DateTimeUTC")

dd = d[d$Transmitter == unique(d$Transmitter)[1], ] # take down to 1 fish to test
dd = dd[1:5, c("Transmitter", "StationName", "arrival", "departure")] # cut down rows and cols needed

# make a column of lagged arrivals so that the indexing with div_dist is easier
dd$first_arrs = data.table::shift(dd$arrival, type = "lead") # is there a way to do this in base?

str(dd)

dd = dd[!is.na(dd$first_arrs), ] # remove last row, as the arrival at last receiver is now on the second-to-last row
dd$distance = 2:5


ans = lapply(seq(nrow(dd)), function(i) div_dist(start = dd$departure[i],  # I don't know about this
                                           end = dd$first_arrs[i], 
                                           distance = dd$distance[i], 
                                           time_units = "hour"))

ans2 = do.call(rbind, ans)
sum(dd$distance) == sum(ans2$prop_dist)

ans2$date = as.Date(ans2$date_time)

tapply(ans2$prop_dist, ans2$date, sum)

ans3 = do.call(rbind, mapply(div_dist, dd$departure, dd$first_arrs, dd$distance, SIMPLIFY = FALSE))
ans3$date = as.Date(ans3$date_time)
all.equal(ans2, ans3)

