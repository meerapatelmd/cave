#' Get the path to the present R script
#' @description This script returns the path of the R script in which it is being executed. It is helpful for documenting dataframes that have been written and README (see Readi package for implementation).
#' @export

present_script_path <-
    function() {
        return(rstudioapi::getSourceEditorContext()$path)
    }

