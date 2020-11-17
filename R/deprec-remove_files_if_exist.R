#' Removes a file if it exists
#' @export

remove_files_if_exist <-
        function(full_file_paths) {

                .Deprecated(new = "file.remove_if_exists")
                for (i in 1:length(full_file_paths)) {
                        full_file_path <- full_file_paths[i]
                        if (file.exists(full_file_path)) {
                                file.remove(full_file_path)
                        }
                }
        }
