#' Create the key for caching
#' @description The list object that serves as a key for the caching functions of the R.cache package. This function differs from use_key in that this one is used to first save a virgin object while the use_key is used to retrieve an object.
#' @export

cut_cache_key <-
    function(object) {
        return(
        list(script_path = present_script_path(),
             object_name = deparse(substitute(object))))
    }
