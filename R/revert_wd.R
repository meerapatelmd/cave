#' Revert wd back to original wd
#' @description This function restores the original working directory when saved using the change_wd function.
#' @export



revert_wd <-
        function(save = TRUE) {
            if (!exists("wd0", envir = globalenv())) {

                    secretary::typewrite_error("No",
                                               crayon::italic("wd0"), "object in .GlobalEnv.")


            } else {

                        if (!(getwd() %in% wd0)) {

                                    if (save == TRUE) {
                                            assign("wd1",
                                                   getwd(),
                                                   envir = globalenv())
                                            secretary::typewrite(crayon::italic("wd1"), "object created.")
                                    }

                                    setwd(wd0)
                                    secretary::typewrite(crayon::italic(wd0), "set as new wd and", crayon::italic("wd0"), "removed from .GlobalEnv.")

                                    rm(wd0, envir = globalenv())

                        } else {

                                secretary::typewrite(crayon::italic("wd0"), "object value of", crayon::italic(wd0), "is the same as current wd. Removing",  crayon::italic("wd0"), "from .GlobalEnv.")

                                rm(wd0, envir = globalenv())

                        }

            }
        }
