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
