#' Append a Path to a Filename
#' @description Append an path to an path-less filename
#' @param filename Path-less filename. For example, "IngestionFile.xlsx".
#' @param path Path to append without the terminal forward-slash. For example, "~/GitHub".
#' @export

append_path <-
    function(filename,
             path) {


                paste0(path, "/", filename)


    }
