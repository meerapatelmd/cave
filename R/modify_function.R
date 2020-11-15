#' @title
#' Add `.Deprecated()` to Text
#' @description
#' `.Deprecated()` is added after each function declaration in the text. Note that it does not check for an existing `.Deprecated()`.
#'
#' @example inst/example/add_deprecated_call.R
#' @param text Character vector containing function declarations.
#' @param new  (Optional) Argument passed to the new call to `.Deprecated()`.
#' @param package PARAM_DESCRIPTION, Default: NULL
#' @seealso
#'  \code{\link[stringr]{str_replace}}
#' @rdname add_deprecated_call
#' @family modify roxygen2 documentation functions
#' @export
#' @importFrom stringr str_replace_all



add_deprecated_call <-
        function(text,
                 new = NULL) {

                if (is.null(new)) {

                stringr::str_replace_all(
                        string  = text,
                        pattern = "(function[(]{1}.*?[)]{1}[{]{1})",
                        replacement = "\\1\n\t\t\t.Deprecated()\n"

                )

                } else {

                        stringr::str_replace_all(
                                string  = text,
                                pattern = "(function[(]{1}.*?[)]{1}[{]{1})",
                                replacement = sprintf("\\1\n\t\t\t.Deprecated(new = '%s')\n",
                                                      new)

                        )

                }


        }


#' @title
#' Add "(Deprecated)" after the `@description` Roxygen2 Tag
#' @param text Character vector containing function declarations.
#' @example inst/example/add_deprecated_to_desc.R
#' @seealso
#'  \code{\link[stringr]{str_replace}}
#' @rdname add_deprecated_to_desc
#' @export
#' @importFrom stringr str_replace_all


add_deprecated_to_desc <-
        function(text) {

                stringr::str_replace_all(
                        string  = text,
                        pattern = "(@description)",
                        replacement = "\\1 (Deprecated)"

                )

        }

