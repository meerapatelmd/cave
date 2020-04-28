#' Copy an R object to another R object of a different name
#' @param new_object_name string of new object name
#' @param object_to_copy_name string of object name to b copied
#' @export

copy_object <-
    function(new_object_name, object_to_copy_name) {
        assign(new_object_name,
               get(object_to_copy_name),
               envir = globalenv())
    }
