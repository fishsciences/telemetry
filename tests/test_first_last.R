# test fl_onefish
library(tools)

ac = readRDS("inst/ac_test.rds")

ac_test = ac[ac$Transmitter == ac$Transmitter[1], ]
ac_test2 = ac[ac$Transmitter == unique(ac$Transmitter)[2], ]

#-------------------------------------------------------#
# fl_onefish tests
#-------------------------------------------------------#

# does it actually return the min and max detection?
x = fl_onefish(ac_test2)
stopifnot(x$DateTimeUC[1] == min(ac_test2$DateTimeUTC))
stopifnot(x$DateTimeUTC[2] == max(ac_test2$DateTimeUTC))

# returns two rows?
stopifnot(nrow(fl_onefish(ac_test)) == 2)

#  test input conditions
# datetimecol should be POSIXct
assertError(fl_onefish(ac_test, "Transmitter"))

# input should be a data.frame
assertError(fl_onefish(df = 1:5, "DateTimeUTC"))
assertError(fl_onefish(df = "x", "DateTimeUTC"))

# when there are simultaneous detections, should still return 2 rows
sims = rbind(ac_test, ac_test)
stopifnot(nrow(fl_onefish(sims, "DateTimeUTC")) == 2)

# when a fish has 1 detection, should return a single row:
one = ac_test[1, ]
stopifnot(nrow(fl_onefish(one)) == 1)


#-------------------------------------------------------#
# first_and_last tests
#-------------------------------------------------------#

x = first_and_last(dets_df = ac, 
                   tagid_col = "Transmitter",
                   datetime_col = "DateTimeUTC")

# number of tags in the ending df should the same as the n tags in the original:
stopifnot(length(unique(x$Transmitter)) == length(unique(ac$Transmitter)))
       