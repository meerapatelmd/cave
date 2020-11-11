#' Remove the file ext from fn
#' @param full_fn filename
#' @importFrom stringr str_remove
#' @export

strip_fn <-
        function(full_fn, rm_ext = TRUE, upto_nchar_file_ext = 4, rm_path = TRUE) {

                .Deprecated("skin_file")

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
                                sub(pattern = "(^.*)([.]{1}.*$)",
                                    replacement = "\\1",
                                    x = file)

                }

                file

        }
