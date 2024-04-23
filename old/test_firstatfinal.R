# test fl_onefish
library(tools)
library(telemetry)

ac = readRDS(system.file(package = "telemetry", "ac_test.rds")) # makes sure that any system that has installed the package can find this

ac$StationName[ac$StationName == "FSB_A"] <- "FSB_B" # group

ac_test = ac[ac$Transmitter == ac$Transmitter[1], ]
ac_test2 = ac[ac$Transmitter == unique(ac$Transmitter)[2], ]

#-------------------------------------------------------#
# :::faf_onefish tests
#-------------------------------------------------------#
# does it return the right detections?
x = telemetry:::faf_onefish(ac_test2, tidc2 = "Transmitter", dtc2 = "DateTimeUTC", stnc2 = "StationName")

stopifnot(x$first_det == min(ac_test2$DateTimeUTC))
stopifnot(x$last_arrival == as.POSIXct("2018-04-29 02:58:00", tz = "UTC"))

y = telemetry:::faf_onefish(ac_test, 
                            tidc2 = "Transmitter", 
                            dtc2 = "DateTimeUTC", 
                            stnc2 = "StationName")

stopifnot(y$first_det == min(ac_test$DateTimeUTC))
stopifnot(y$first_stn == "RGD_VR2W")
stopifnot(y$last_arrival == as.POSIXct("2018-05-01 17:11:53", tz = "UTC"))

# does it return one row?
stopifnot(nrow(telemetry:::faf_onefish(ac_test, 
                                       tidc2 = "Transmitter", 
                                       dtc2 = "DateTimeUTC", 
                                       stnc2 = "StationName")) == 1)


# when there are simultaneous detections, should still return 1 row
sims = rbind(ac_test, ac_test)
z = telemetry:::faf_onefish(sims, tidc2 = "Transmitter",
                                             dtc2 = "DateTimeUTC",
                                             stnc2 = "StationName")

stopifnot(identical(y, z)) # should return the same result as above

# when a fish has 1 detection, should return a single row:
one = ac_test[1, ]
stopifnot(nrow(telemetry:::faf_onefish(one, tidc2 = "Transmitter",
                                             dtc2 = "DateTimeUTC",
                                             stnc2 = "StationName")) == 1)


#-------------------------------------------------------#
# first_and_last tests
#-------------------------------------------------------#
#  test input conditions
# datetimecol should be POSIXct
assertError(telemetry:::first_at_final(ac,  "Transmitter",
                                            "Transmitter",
                                            "StationName"))
x = first_at_final(dets_df = ac, 
                   tagid_col = "Transmitter",
                   datetime_col = "DateTimeUTC",
                   station_col = "StationName")

# number of tags in the ending df should the same as the n tags in the original:
stopifnot(length(unique(x$TagID)) == length(unique(ac$Transmitter)))
