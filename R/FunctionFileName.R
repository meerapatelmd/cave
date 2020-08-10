#' @title Function FileName
#' @description
#' This function compares the name of the file in the R subdir within the working directory and with the name of the function within the file.
#' @return
#' dataframe with `fileName` and `functionName` columns
#' @seealso
#'  \code{\link[purrr]{map}},\code{\link[purrr]{set_names}}
#'  \code{\link[readr]{read_lines}}
#'  \code{\link[stringr]{str_remove}}
#'  \code{\link[rubix]{vector_to_tibble}}
#'  \code{\link[dplyr]{bind}},\code{\link[dplyr]{mutate}}
#' @rdname FunctionFileName
#' @export
#' @importFrom purrr map set_names
#' @importFrom readr read_lines
#' @importFrom stringr str_remove_all
#' @importFrom rubix vector_to_tibble
#' @importFrom dplyr bind_rows mutate %>%

FunctionFileName  <-
        function() {
                list.files("R", full.names = TRUE) %>%
                        purrr::map(readr::read_lines) %>%
                        purrr::map(function(x) grep(pattern = "<-",
                                                    x,
                                                    value = TRUE)[1]) %>%
                        purrr::map(function(x) stringr::str_remove_all(x, "[ ]{0,}[<]{1}[-]{1}[ ]{0,1}$")) %>%
                        purrr::set_names(list.files("R")) %>%
                        purrr::map(rubix::vector_to_tibble, new_col = "functionName") %>%
                        dplyr::bind_rows(.id = "fileName") %>%
                        dplyr::mutate(fileName = stringr::str_remove_all(fileName, pattern = "[.]{1}R$"))
        }
