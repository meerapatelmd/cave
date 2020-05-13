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
