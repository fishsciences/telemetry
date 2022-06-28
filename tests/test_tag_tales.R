# test tag_tales

# working out redRowFun:
# set.seed(1)
# x = runif(6)
# thresh = 0.25
# abs(diff(x)) > thresh # should be F, F, T, T, T
# bv = cumsum(c(0, abs(diff(x))) > thresh) # should be: 0, 0, 0, 1, 2, 3; i.e., rows, 5, and 6 should have their own visits

library(telemetry)

# test one fish
d = readRDS("FishID_568.YBUS_test_tagtales.rds")
d[order(d$DateTime_PST), ] # expected results: Verona arrival/departure same, Sacd.4 arrival/departure same, then arrival at Mal10.b @ 00:47:24, and departure at 00:51:06.

tag_tales(d, "TagID", "GEN", "DateTime_PST") # add stopifnot(identical()) test here to compare static inputs/outputs
tag_tales(d, d$TagID, d$GEN, "DateTime_PST")
# tag_tales(d, d$TagID, d$GEN, d$DateTime_PST) # make error better

x = readRDS(system.file(package = "telemetry", "10.ybus_test_data.rds"))
x = x[order(x$DateTime_PST), ]
y = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST")
y
# test multiple fish
m = readRDS(system.file(package = "telemetry", "ac_test.rds"))
z = tag_tales(m, m$Transmitter, m$StationName)
