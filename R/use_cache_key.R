#' Create the key for caching
#' @description The list object that serves as a key for the caching functions of the R.cache package. This function differs from cut_key in that this one is used to retrieve a cached object if it exists.
#' @export

use_cache_key <-
    function(object_name) {
        return(
        list(script_path = present_script_path(),
             object_name = object_name)
        )
    }
