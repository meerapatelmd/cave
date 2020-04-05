#' Copies dataframe copied to clipboard
#' @export

copy_to_clipboard <- function(dataframe) {
                            clip <- pipe("pbcopy", "wb")
                            write.table(dataframe, clip, sep = "\t", row.names = FALSE)
                            close(clip)
}
