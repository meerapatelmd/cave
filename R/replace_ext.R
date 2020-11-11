#' Replace the Extension of a Filename
#' @param original_fn Original filename including extension. For example, "IngestionFile.xlsx".
#' @param replace_ext Extension to replace the original filename's extension with. For example, "csv".
#' @importFrom stringr str_replace_all
#' @export

replace_ext <-
    function(original_fn,
             replace_ext) {

            .Deprecated("swap_ext")

                paste0(
                stringr::str_replace_all(original_fn,
                                         pattern = "(^.*)([.]{1}.*$)",
                                         replacement = "\\1."),
                    replace_ext)


    }
