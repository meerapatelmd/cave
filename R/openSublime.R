#' Open a File in Sublime
#' @export

openSublime <-
        function(file) {

                system(paste0("open ", file))
        }
