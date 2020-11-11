#' Remove Objects from the Global Environment
#' @export

rmAll <-
        function(except = NULL) {

                allObjs <- ls(envir = globalenv())

                if (is.null(except)) {

                        rm(list = allObjs,
                           envir = globalenv())

                } else {

                        someObjs <- allObjs[!(allObjs %in% except)]
                        rm(list = someObjs,
                           envir = globalenv())
                }
        }


#' Removes all objects in the global environment that have a certain pattern
#' @param ends_with_pattern pattern that the object name starts with
#' @export

rm_all_end_with <-
        function(ends_with_pattern) {
                rm(list = objects(pattern = paste0(ends_with_pattern, "$"), envir = globalenv()), envir = globalenv())
        }


#' Removes all objects in the global environment that have a certain pattern
#' @param starts_with_pattern pattern that the object name starts with
#' @export

rm_all_objects_that_start_with <-
        function(starts_with_pattern) {
                rm(list = objects(pattern = paste0("^", starts_with_pattern), envir = globalenv()), envir = globalenv())
        }





#' Removes R objects in the global environment without warning if R object doesn't exist
#' @param robj_names vector of length 1 of greater of R object names
#' @export

rm_all <-
        function(robj_names) {
                suppressWarnings(rm(list = robj_names, envir = globalenv()))
        }





#' Removes R objects in the global environment if R object doesn't exist
#' @param r_object single R object that is removed if it is present in the environment
#' @export

rm_if_exists <-
        function(r_object, envir = globalenv()) {
                if (exists(deparse(substitute(r_object)), envir = envir)) {
                        rm(list = deparse(substitute(r_object)), envir =envir)
                }
        }





