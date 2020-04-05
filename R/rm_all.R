#' Removes R objects in the global environment without warning if R object doesn't exist
#' @param robj_names vector of length 1 of greater of R object names
#' @export

rm_all <-
        function(robj_names) {
                suppressWarnings(rm(list = robj_names, envir = globalenv()))
        }
