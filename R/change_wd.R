#' Set a new wd while saving the previous one
#' @description On the condition that the new_wd is not the same as the current wd, this function sets a new working directory while saving the previous wd as a `wd0` object. If the condition is not met, no new wd is set and a `wd0` object will not be returned to the global environment.
#' @importFrom secretary typewrite
#' @importFrom crayon italic
#' @export


change_wd <-
    function(new_wd, save = TRUE) {
        new_wd <- path.expand(new_wd)
        if (getwd() != new_wd) {
                        if (save == TRUE) {

                                assign("wd0",
                                        getwd(),
                                       envir = globalenv())
                                secretary::typewrite(crayon::italic("wd0"), "object created.")

                        }

                        setwd(new_wd)
                        secretary::typewrite(crayon::italic(new_wd), "set as new wd.")

        } else {

                        secretary::typewrite(crayon::italic(new_wd), "is current wd. No changes made.")

        }

    }
