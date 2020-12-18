setMethod("$", "telemetry",
          function(x, name)
              slot(x, name))

setMethod("[", "telemetry",
          function(x, i, j, ..., drop = TRUE)
          {

          })

setMethod("[[", "telemetry",
          function(x, i, j, ...){

          })

