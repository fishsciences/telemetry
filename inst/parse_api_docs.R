library(RJSONIO)

doc_file = "inst/docs.md"

ll = readLines(doc_file)

end_points = grep("^## ", ll)

json_start = grep("^```javascript", ll)+1
json_end = grep("^```$", ll)-1

first_block = sapply(end_points, function(i) which(json_start > i)[1])

idx = cbind(json_start[first_block], json_end[first_block])

templates = lapply(seq(nrow(idx)), function(i)
  fromJSON(textConnection(ll[idx[i,1]:idx[i,2]])))

names(templates) = gsub("## POST ", "", ll[end_points])



templates = lapply(templates, unlist)
schema = lapply(templates, names)

schema = lapply(schema, function(x) strsplit(x, "\\."))
api_variable_names = lapply(schema, function(x) sapply(x, function(y) y[length(y)]))

## Manually fix network and batch
api_variable_names$`/api/admin/create/batch` = grep("Fork Length|Weight|fields|units|unTagName|tagDataTime|tagDataPayload",
                                                    api_variable_names$`/api/admin/create/batch`,
                                                    invert = TRUE, value = TRUE)
api_variable_names$`/api/admin/create/batch` = c(api_variable_names$`/api/admin/create/batch`,
                                                 "batchDataSchema", "createBatchReqTags")

api_variable_names$`/api/admin/create/network` = c("unNetName", "unOID", "unToken", "antData")

save(api_variable_names, file = "data/api_variable_names.rda")
