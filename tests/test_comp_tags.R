
a = letters[1:3]
b = letters[3:5]

# should return: the length of unique items in each vector (v1, v2)
telemetry:::comp_tags(a, b)
stopifnot(all(unname(sapply(telemetry:::comp_tags(a, b), sum)) == c(3, 3, 1, 1))) # 


a = b = letters

stopifnot(all(sapply(telemetry:::comp_tags(a, b), unique) == 26)) # all should be 26

