#' Creates folder in working dir if doesn't exist
#' @param folder_name name of the directory
#' @export
#'
create_dir_if_not_exist <-
        function(folder_name) {
                if (!(dir.exists(folder_name))) {
                        dir.create(folder_name)
                }
        }
