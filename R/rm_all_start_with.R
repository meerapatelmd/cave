#' Removes all objects in the global environment that have a certain pattern
#' @param starts_with_pattern pattern that the object name starts with
#' @export

rm_all_objects_that_start_with <-
        function(starts_with_pattern) {
                rm(list = objects(pattern = paste0("^", starts_with_pattern), envir = globalenv()), envir = globalenv())
        }
