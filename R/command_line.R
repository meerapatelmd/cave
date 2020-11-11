#' @title
#' Open a File in a Specific Application
#'
#' @param app Path to the Application
#' @export

cl_open_ff <-
        function(app) {

                function(file) {

                        file <- normalizePath(path = file,
                                              mustWork = TRUE)


                        system(sprintf("open -a %s %s", app, file))


                }


        }



#' @title
#' Generic Command Line Open Command
#' @export

open_sesame <-
        function(file) {

                file <- normalizePath(path = file,
                                      mustWork = TRUE)


                system(sprintf("open %s", file))

}
