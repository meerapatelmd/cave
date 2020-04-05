#' Replace a folder
#' @param path_to_dir path to the folder that is replacing
#' @param path_to_dir_to_replace path to folder that is being replaced
#' @details The name of the replacement folder will stay the same and will not take the name of path_to_dir if the names differ.
#' @export

replace_dir <-
        function(path_to_dir, path_to_dir_to_replace) {
                unlink(path_to_dir_to_replace, recursive = TRUE)
                dir.create(path_to_dir_to_replace)
                file.copy(path_to_dir,
                          dirname(path_to_dir_to_replace),
                          recursive = TRUE)
        }
