#' List files from today based on Filename
#' @export

list_files_from_today <-
    function(...) {
        list_files_from(date = Sys.Date(), ...)
    }
