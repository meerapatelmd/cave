#' Duplicate Functions
#' @import purrr
#' @import readr
#' @import stringr
#' @import rubix
#' @import dplyr
#' @export

duplicateFunctions <-
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
                        dplyr::mutate(fileName = stringr::str_remove_all(fileName, pattern = "[.]{1}R$")) %>%
                        rubix::summarize_grouped_n(functionName) %>%
                        dplyr::filter(n > 1)
        }
