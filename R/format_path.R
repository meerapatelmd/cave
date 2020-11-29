



#' @export

format_path_cli <-
        function(path) {

                path <- path.expand(path)
                path <- gsub(" ", "\\ ", path)
                path <- gsub("|", "\\|", path, fixed = TRUE)
                path <- gsub("-", "\\-", path, fixed = TRUE)

                path
        }


#' @export

open_dir <-
        function(dir) {
                dir <- format_path_cli(path = dir)
                system(paste(Sys.getenv("R_BROWSER"), dir))
        }
