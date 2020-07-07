#' Deprecate all Excels in wd
#' @description A deprecated/ dir is created if it does not already exist and all files with the pattern "xlsx$" are moved to this folder.
#' @importFrom purrr map2
#' @export

deprecate_all_excel <-
    function() {
        create_dir_if_not_exist("deprecated")
        list.files(pattern = "xlsx$", full.names = TRUE) %>%
            purrr::map2(.y = paste0("deprecated/", list.files(pattern = "xlsx$")),
                        function(x,y) file.rename(from = x,
                                                  to = y))
    }

#' Deprecate all csvs in wd
#' @description A deprecated/ dir is created if it does not already exist and all files with the pattern "csv$" are moved to this folder.
#' @importFrom purrr map2
#' @export

deprecate_all_csv <-
    function() {
        create_dir_if_not_exist("deprecated")
        list.files(pattern = "csv$", full.names = TRUE) %>%
            purrr::map2(.y = paste0("deprecated/", list.files(pattern = "csv$")),
                        function(x,y) file.rename(from = x,
                                                  to = y))
    }

#' Deprecate all txt files in wd
#' @description A deprecated/ dir is created if it does not already exist and all files with the pattern "txt$" are moved to this folder.
#' @importFrom purrr map2
#' @export

deprecate_all_txt <-
    function() {
        create_dir_if_not_exist("deprecated")
        list.files(pattern = "txt$", full.names = TRUE) %>%
            purrr::map2(.y = paste0("deprecated/", list.files(pattern = "txt$")),
                        function(x,y) file.rename(from = x,
                                                  to = y))
    }
