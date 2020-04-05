#' Reads from clipboard
#' @export
#'
read_clipboard <- function(header = TRUE) {
        if (header == TRUE) {
                return(read.table(pipe("pbpaste"), sep= "\t", header= TRUE))
        } else {
                return(read.table(pipe("pbpaste"), sep= "\t", header= FALSE))
        }
}
