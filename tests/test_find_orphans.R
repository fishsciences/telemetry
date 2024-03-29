# test find_orphans
# Fri Oct  7 11:56:05 2022 America/Los_Angeles ------------------------------
library(telemetry)
library(data.table)
load(system.file(package = "telemetry", "test_find_orphans.rda")) # test data from a single receiver in the WST synthesis dataset.  Includes its full deployment history and a subset of detections from a subset of tagged fish.  Should contain 7 orphan detections w/ no fuzzy match.

# this function should issue a warning for this test data
testthat::expect_warning(find_orphans(test_dets, test_deps, fuzzy_match = 0))

# should find 7 orphan detections
ans = find_orphans(test_dets, test_deps, fuzzy_match = 0)
stopifnot(sum(is.na(ans$ExpandedEnd)) == 7)


# when you increase the fuzzy match you should have more mults and fewer orphans
ans2 = find_orphans(test_dets, test_deps)
stopifnot(sum(is.na(ans2$ExpandedEnd)) < sum(is.na(ans$ExpandedEnd)))

# there should be no duplicate detections in the test data
testthat::expect_false(any(duplicated(test_dets[ , c("TagID", "DateTimePST")])))

# there should be duplicates (mult matches) in the return with fuzzy_match != 0
stopifnot(any(duplicated(ans2[ , c("TagID", "DateTimePST")])))

# test with different column names
copy = test_dets
copy$DT = copy$DateTimePST
copy$DateTimePST = NULL # remove that default col

copydeps = test_deps
copydeps$DS = copydeps$DeploymentStart
copydeps$DeploymentStart = NULL

testthat::expect_error(find_orphans(copy, 
                    copydeps,
                    deployment_start_col = "DeploymentStart",
                    deployment_end_col = "DeploymentEnd",
                    deployment_rec_col = "Receiver",
                    detections_df_datetime_col = "DT",
                    fuzzy_match = 60*60
                    ))

ans3 = find_orphans(
  copy,
  copydeps,
  deployment_start_col = "DS",
  deployment_end_col = "DeploymentEnd",
  deployment_rec_col = "Receiver",
  detections_df_datetime_col = "DT",
  fuzzy_match = 60 * 60
)
