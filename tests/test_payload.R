library(telemetry)
library(tools)

test_df = data.frame(unATID = letters,
                     antDataEnd = Sys.time(),
                     unLat = 1,
                     unLong = -1,
                     unAntName = LETTERS,
                     unRegion = 1,
                     antDataStart = Sys.time())


## Test checks
assertError(telemetry:::check_data_types(list(unOID = "bob")))
telemetry:::check_data_types(list(unOID = 1, Region = 2))

assertError(telemetry:::check_data_types(list(unOID = 1, Region = "2")))

assertError(telemetry:::check_data_types(list(name = 1)))
assertError(telemetry:::check_data_types(list(unToken = 1)))

assertError(check_variables(list(unOID = 1), "/api/admin/create/user"))
check_variables(list(unToken = "a"), "api/list/orgs")

## Test payloads

dd = create_antenna_data(test_df[1:2,])
x = create_payload("/api/admin/create/network",
               antData = create_antenna_data(test_df[1:2,]),
               unNetName = "test network",
               unOID = 5,
               unToken = "bob")
cat(RJSONIO::toJSON(x))
