#' @title Duplicate Functions
#' @seealso
#'  \code{\link[purrr]{map}},\code{\link[purrr]{set_names}}
#'  \code{\link[readr]{read_lines}}
#'  \code{\link[stringr]{str_remove}}
#'  \code{\link[rubix]{vector_to_tibble}}
#'  \code{\link[dplyr]{bind}},\code{\link[dplyr]{mutate}},\code{\link[dplyr]{group_by}},\code{\link[dplyr]{summarise}},\code{\link[dplyr]{arrange}},\code{\link[dplyr]{filter}}
#' @rdname duplicateFunctions
#' @export
#' @importFrom purrr map set_names
#' @importFrom readr read_lines
#' @importFrom stringr str_remove_all
#' @importFrom tibble tibble
#' @importFrom dplyr bind_rows mutate group_by summarize arrange ungroup filter %>%

duplicateFunctions <-
        function() {

                new_col <- "functionName"

                list.files("R", full.names = TRUE) %>%
                        purrr::map(readr::read_lines) %>%
                        purrr::map(function(x) grep(pattern = "<-",
                                                    x,
                                                    value = TRUE)[1]) %>%
                        purrr::map(function(x) stringr::str_remove_all(x, "[ ]{0,}[<]{1}[-]{1}[ ]{0,1}$")) %>%
                        purrr::set_names(list.files("R")) %>%
                        purrr::map(function(x) tibble::tibble(`:=`(!!new_col, x))) %>%
                        dplyr::bind_rows(.id = "fileName") %>%
                        dplyr::mutate(fileName = stringr::str_remove_all(fileName, pattern = "[.]{1}R$")) %>%
                        dplyr::group_by(functionName) %>%
                        dplyr::summarize(n = n(), .groups = "drop") %>%
                        dplyr::arrange(n) %>%
                        dplyr::ungroup() %>%
                        dplyr::filter(n > 1)
        }
