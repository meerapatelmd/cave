#' Returns the script step number
#' @description returns the first 2 digits of the present R script filename
#' @importFrom stringr str_replace_all
#' @export


script_step_number <-
    function() {
        return(stringr::str_replace_all(strip_fn(present_script_path()), "([0-9]{2})(.*$)", "\\1"))
    }
