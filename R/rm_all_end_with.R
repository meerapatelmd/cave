#' Removes all objects in the global environment that have a certain pattern
#' @param ends_with_pattern pattern that the object name starts with
#' @export

rm_all_end_with <-
        function(ends_with_pattern) {
                rm(list = objects(pattern = paste0(ends_with_pattern, "$"), envir = globalenv()), envir = globalenv())
        }
