#' Compare tags
#'
#' @author Myfanwy Johnston, Matt Espe
#'
#' @param v1 A vector, probably of TagIDs
#' @param v2 A second vector to compare with the first vector
#'
#' @return Returns a list of two: the first item in the list is the total length of unique things in v1. The second is the total number of unique things in v1 that are also found in v2.
#' @export
#'
#' @examples
#' comp_tags(1:5, 5:10)
#' comp_tags(v1 = c("A69-1303-63038", "A69-1303-63039", "A69-1303-63040"),
#'           v2 = c("A69-1303-33085", "A69-1303-33088", "A69-1303-33089"))
#'           
comp_tags = function(v1, v2) {
  
  list(length_unique_v1 = length(unique(v1)),
       length_unique_v2 = length(unique(v2)),
       sum_unique_v1_in_v2 = length(unique(v1)) - length(setdiff(v1, v2)),
       sum_unique_v2_in_v1 = length(unique(v2)) - length(setdiff(v2, v1))
  )
  
}
