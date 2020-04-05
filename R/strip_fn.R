#' Remove the file ext from fn
#' @param full_fn filename
#' @importFrom stringr str_remove
#' @export

strip_fn <-
        function(full_fn, rm_ext = TRUE, upto_nchar_file_ext = 4, rm_path = TRUE) {
                x <- full_fn
                if (rm_ext == TRUE) {
                        x <- str_remove(full_fn, paste0("[.]{1}[a-zA-Z]{1,",
                                                        upto_nchar_file_ext,
                                                        "}$")
                        )
                }

                if (rm_path == TRUE) {
                        x <- basename(x)
                }

                return(x)
        }
