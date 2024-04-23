# test tag_tales

# working out redRowFun:
# set.seed(1)
# x = runif(6)
# thresh = 0.25
# abs(diff(x)) > thresh # should be F, F, T, T, T
# bv = cumsum(c(0, abs(diff(x))) > thresh) # should be: 0, 0, 0, 1, 2, 3; i.e., rows, 5, and 6 should have their own visits

library(telemetry)

# test one fish
#d = readRDS("FishID_568.YBUS_test_tagtales.rds")
#d[order(d$DateTime_PST), ] # expected results: Verona arrival/departure same, Sacd.4 arrival/departure same, then arrival at Mal10.b @ 00:47:24, and departure at 00:51:06.

#tag_tales(d, "TagID", "GEN", "DateTime_PST") # add stopifnot(identical()) test here to compare static inputs/outputs
#tag_tales(d, d$TagID, d$GEN, "DateTime_PST")
# tag_tales(d, d$TagID, d$GEN, d$DateTime_PST) # make error better

# check that data frame does not need to be ordered by date time first for tag_tales to give same results:
aa = readRDS(system.file(package = "telemetry", "10.ybus_test_data.rds"))
x = aa[order(aa$DateTime_PST), ]
y = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST")
z = tag_tales(aa, "FishID", "GEN", Datetime_col = "DateTime_PST")
stopifnot(identical(y, z))


# test multiple fish
m = readRDS(system.file(package = "telemetry", "ac_test.rds"))
z = tag_tales(m, m$Transmitter)

# Check for bug in issue #2
# get first row for each fish

tt = by(m, m$Transmitter, function(df){
    df[which.min(df$DetectionDateTimeUTC),]
})

# first visit in result
t2 = by(z, z$Transmitter, function(df){
    df[which.min(df$arrival),]
})

#The TagIDs should match
all(names(tt) == names(t2))

# The station name and times should match for the earliest detection
stopifnot(all(sapply(tt, `[[`, "StationName") == sapply(t2, `[[`, "StationName")))
stopifnot(all(sapply(tt, `[[`, "DateTimeUTC") == sapply(t2, `[[`, "arrival"))) # This fails when the visits are arbitrary

# Check that they all have the right stations
tt = tapply(m$StationName, m$Transmitter, unique)

zs = split(z, z$Transmitter)

stopifnot(all(mapply(function(a, b){
    all(b %in% a$StationName)
}, zs[names(tt)], tt)))

# Make sure time stamps are valid
ms = split(m, m$Transmitter)

stopifnot(mapply(function(a, b){
    all(a$arrival %in% b$DateTimeUTC)},
    zs[names(ms)], ms))

# Check handling of Station_col arg
tools::assertError(tag_tales(m, m$Transmitter, Station_col = m$StationName))
tools::assertError(tag_tales(m, m$Transmitter, Station_col = "Bob"))
tools::assertError(tag_tales(m, m$Transmitter, Station_col = rep("StationName", 10)))
tools::assertError(tag_tales(m, m$Transmitter, Station_col = 10))
