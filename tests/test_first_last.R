# test fl_onefish
ac = readRDS("inst/ac_test.rds")

ac_test = ac[ac$Transmitter == ac$Transmitter[1], ]

# tests
firstlast1fish(ac_test)
#  - does it check the time col?
firstlast1fish(ac_test, "Transmitter")
# does it accept vectors?
firstlast1fish(df = 1:5, "DateTimeUTC")
firstlast1fish(df = "x", "DateTimeUTC")

# - what does it do when you have simultaneous detections?
sims = rbind(ac_test, ac_test)
firstlast1fish(sims, "DateTimeUTC")
# - what does it do when you only have 1 detection for a fish?
one = ac_test[1, ]
firstlast1fish(one)

# - does it handle dfs with NAs?

x = first_and_last(ac, "Transmitter")
x
