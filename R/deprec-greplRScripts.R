#' Find R Scripts with a Pattern
#' @description This function identifies R scripts in the R subdirectory in the working directory that contains the pattern given as the argument.
#' @param pattern pattern passed as the pattern argument in the grepl function
#' @importFrom readr read_file
#' @export

greplRScripts <-
    function(pattern) {

        .Deprecated(new = "grepl_r_dir")

        FILES <- list.files(path = "R", pattern = "[.]R$", full.names = TRUE)

        output <- vector()

        for (FILE in FILES) {

            input <- readr::read_file(FILE)

            if (grepl(pattern = pattern, input)) {

                output <-
                        unique(c(output,
                          FILE))
            }

        }

        return(output)

    }
