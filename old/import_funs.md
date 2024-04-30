# Notes on how to write new import functions

The general strategey for the import functions is that to take
divergent data formats from the various telemetry systems and convert
to a unified `telemetry` object. Some of these steps might be generic
to all data, e.g. convert character dates to POSIX values, substitute
`NA` for "?", etc. For these tasks, there should be a generic import
function (to avoid writing the same code repeatedly). 

For issues which are specific to a certain type of telemetry data,
there should be a specific method which will do those steps as needed,
then call the generic function to take care of the rest.


