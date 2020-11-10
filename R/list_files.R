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





#' List files from today based on Filename
#' @export

list_files_from_today <-
    function(...) {
        list_files_from(date = Sys.Date(), ...)
    }





#' List Files From a Particular Date Based on Filename
#' @param date Date in "YYYY-MM-DD" format
#' @return Unlike the list.files function, this function returns a dataframe instead of a vector
#' @importFrom dplyr filter
#' @export


list_files_from <-
    function(date, ...) {
        file_dates <- list_files_date(...)
        file_dates %>%
            dplyr::filter(Date == date)
    }


file_info_df <- file.info(list.files(path = "R", full.names = TRUE))


#' List Files with Size in MB
#' @return dataframe in descending order of files
#' @importFrom dplyr mutate
#' @importFrom dplyr filter
#' @importFrom dplyr select
#' @importFrom dplyr arrange
#' @importFrom tibble tibble
#' @export

list_files_size <-
    function(...) {
        tibble::tibble(fns = list.files(...)) %>%
            dplyr::mutate(size = size_in_mb(fns)) %>%
            dplyr::arrange(desc(size)) %>%
            dplyr::select(Filenames = fns,
                          Size = size) %>%
            dplyr::arrange(desc(Size))
    }





