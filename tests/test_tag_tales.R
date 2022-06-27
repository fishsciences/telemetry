# test tag_tales

# the prior version of tag_tales allowed for overlapping detection histories within its summary.  That is, arrivals at one receiver could fall within the interval of an arrival and departure at a different receiver. 

# e.g., before we might have visit A 1-2pm, and visit B 1:30-2:30.  

# overlaps = TRUE - A 1-2pm, B 1:30-2:30
# A 1-1:15 pm, B1:30-2:30, A 1:35 - 2:15



#Without overlaps, we have A 1-1:30, B 1:30 - 1:45, A 1:45-2, B 2-2:30

# working out redRowFun:
set.seed(1)
x = runif(6)
x
thresh = 0.25
abs(diff(x)) > thresh # should be F, F, T, T, T

breakup_vector = as.factor(cumsum(c(0, abs(diff(x))) > thresh)) # should be: 0, 0, 0, 1, 2, 3
breakup_vector

# this is within a station visit - one station, do we need multiple visits?  This says yes - so we need to call the breakup vector again on the values within 



library(telemetry)

d = readRDS("tests/FishID_568.YBUS_test_tagtales.rds")
d[order(d$DateTime_PST), ] # expected results: Verona arrival/departure same, Sacd.4 arrival/departure same, then arrival at Mal10.b @ 00:47:24, and departure at 00:51:06.


splitFishStationVisits(d, "GEN", 60*60, dtc2 = "DateTime_PST")


tag_tales(d, "TagID", "GEN", "DateTime_PST", allow_overlap = TRUE)

tag_tales(d, "TagID", "GEN", "DateTime_PST", allow_overlap = FALSE)


d2 = read.csv("tests/test-overlaps.csv")

d2$DateTime_PST = lubridate::ymd_hms(d2$DateTime_PST)

tag_tales(d2, "TagID", "GEN", "DateTime_PST", allow_overlap = TRUE)
tag_tales(d2, "TagID", "GEN", "DateTime_PST", allow_overlap = FALSE)



x = readRDS("inst/10.ybus_test_data.rds")
y = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST", allow_overlap = TRUE)
y

z = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST", allow_overlap = FALSE)
z
