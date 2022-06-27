# test tag_tales

# working out redRowFun:
# set.seed(1)
# x = runif(6)
# thresh = 0.25
# abs(diff(x)) > thresh # should be F, F, T, T, T
# bv = cumsum(c(0, abs(diff(x))) > thresh) # should be: 0, 0, 0, 1, 2, 3; i.e., rows, 5, and 6 should have their own visits

library(telemetry)

# test one fish
d = readRDS("tests/FishID_568.YBUS_test_tagtales.rds")
d[order(d$DateTime_PST), ] # expected results: Verona arrival/departure same, Sacd.4 arrival/departure same, then arrival at Mal10.b @ 00:47:24, and departure at 00:51:06.

tag_tales(d, "TagID", "GEN", "DateTime_PST")

tag_tales(d, d$TagID, d$GEN, d$DateTime_PST) # make error better
tag_tales(d, d$TagID, d$GEN, "DateTime_PST") 


# test multiple fish
x = readRDS("inst/10.ybus_test_data.rds")
y = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST")
y

z = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST", allow_overlap = FALSE)
z