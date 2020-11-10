#' Cache an object for retrieval later
#' @description This function uses the R.cache package, but creates a key automatically based on the present R script and the object name. The directory for the cache also by default is in the set path with a subdirectory that matches the name of the working directory.
#' @param object object to cache.
#' @importFrom R.cache saveCache
#' @export

cache_object <-
    function(object) {
        .Deprecated()
        object_name <- deparse(substitute(object))
        key <- use_cache_key(object_name = object_name)

        print(key)

        dirs <- strip_fn(getwd())
        x <- R.cache::saveCache(object = object,
                           key = key,
                           dirs = dirs)

        secretary::typewrite_bold("Object cached to", x, ".")
    }



