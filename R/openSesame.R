#' Open a File
#' @export

openSesame <-
        function(file) {

                system(paste0("open ", file))
        }
