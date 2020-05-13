#' List Files with Date in Filename
#' @importFrom dplyr mutate
#' @importFrom dplyr filter
#' @importFrom dplyr select
#' @importFrom dplyr arrange
#' @importFrom tibble tibble
#' @export

list_files_date <-
    function(...) {
        tibble::tibble(fns = list.files(...)) %>%
            dplyr::mutate(dte = lubridate::ymd(stringr::str_remove_all(fns, "[^[0-9]]"), quiet = TRUE)) %>%
            dplyr::mutate(dt = lubridate::ymd_hms(stringr::str_remove_all(fns, "[^[0-9]]"), quiet = TRUE)) %>%
            dplyr::mutate(dt = as.Date(dt)) %>%
            dplyr::mutate(dte = dplyr::coalesce(dte,dt)) %>%
            dplyr::filter(!is.na(dte)) %>%
            dplyr::select(Filenames = fns,
                          Date = dte) %>%
            dplyr::arrange(Filenames)
    }
