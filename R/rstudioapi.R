#' Get the path to the present R script
#' @description
#' (Deprecated) This script returns the path of the R script in which it is being executed. It is helpful for documenting dataframes that have been written and README (see Readi package for implementation).
#' @export

present_script_path <-
  function() {
    .Deprecated("script_path")
    return(rstudioapi::getSourceEditorContext()$path)
  }


#' Script Path
#' @importFrom rstudioapi isAvailable getSourceEditorContext
#' @export

script_path <-
  function() {
    if (rstudioapi::isAvailable()) {
      rstudioapi::getSourceEditorContext()$path
    }
  }
