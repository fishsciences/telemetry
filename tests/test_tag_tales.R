# test tag_tales
library(telemetry)

d = readRDS("tests/FishID_568.YBUS_test_tagtales.rds")
d[order(d$DateTime_PST), ]

tag_tales(d, "TagID", "GEN", "DateTime_PST", allow_overlap = TRUE)

tag_tales(d, "TagID", "GEN", "DateTime_PST", allow_overlap = FALSE)





x = readRDS("inst/10.ybus_test_data.rds")
y = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST", allow_overlap = TRUE)
y

z = tag_tales(x, "FishID", "GEN", Datetime_col = "DateTime_PST", allow_overlap = FALSE)
z
