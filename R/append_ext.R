#' Append an Extension to a Filename
#' @description Append an extension to an extension-less filename
#' @param filename Extension-less filename. For example, "IngestionFile".
#' @param ext Extension to append withou the period. For example, "csv".
#' @export

append_ext <-
    function(filename,
             ext) {


                paste0(filename, ".", ext)


    }
