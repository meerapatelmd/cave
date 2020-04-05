#' Removes R objects in the global environment if R object doesn't exist
#' @param r_object single R object that is removed if it is present in the environment
#' @export

rm_if_exists <-
        function(r_object, envir = globalenv()) {
                if (exists(deparse(substitute(r_object)), envir = envir)) {
                        rm(list = deparse(substitute(r_object)), envir =envir)
                }
        }
