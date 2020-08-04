#' Function FileName
#' @description This function compares the name of the file in the R subdir within the working directory and with the name of the function within the file.
#' @return dataframe with `fileName` and `functionName` columns
#' @import purrr
#' @import dplyr
#' @import stringr
#' @import rubix
#' @import readr
#' @export

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
