#' @title
#' Remove Path and Extension of a File
#'
#' @param file String
#' @param rm_path Remove the path in the `file` argument?
#' @param rm_ext Remove the extension in the `file` argument?
#' @export


skin_file <-
  function(file,
           rm_path = TRUE,
           rm_ext = TRUE) {
    if (rm_path) {
      file <- basename(file)
    }

    if (rm_ext) {
      file <-
        sub(
          pattern = "(^.*)([.]{1}.*$)",
          replacement = "\\1",
          x = file
        )
    }

    file
  }
