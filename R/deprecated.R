#' Find R Scripts with a Pattern
#' @description Deprecated. This function identifies R scripts in the R subdirectory in the working directory that contains the pattern given as the argument.
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





#' Filesize in GB
#' @param full_fn vector of full file paths
#' @export

size_in_gb <-
  function(full_fns) {
              .Deprecated()
              return((file.size(full_fns))/1e9)
  }





#' Filesize in GB
#' @param full_fn vector of full file paths
#' @export

size_in_gigabytes <-
  function(full_fns) {
    .Deprecated()
              return((file.size(full_fns))/1e9)
  }





#' Filesize in GB
#' @param full_fn vector of full file paths
#' @export

size_in_kb <-
  function(full_fns) {
    .Deprecated()
              return((file.size(full_fns))/1e3)
  }





#' Filesize in GB
#' @param full_fn vector of full file paths
#' @export

size_in_mb <-
  function(full_fns) {
    .Deprecated()
              return((file.size(full_fns))/1e6)
  }










#' Set a new wd while saving the previous one
#' @description On the condition that the new_wd is not the same as the current wd, this function sets a new working directory while saving the previous wd as a `wd0` object. If the condition is not met, no new wd is set and a `wd0` object will not be returned to the global environment.
#' @importFrom secretary typewrite
#' @importFrom crayon italic
#' @export

change_wd <-
    function(new_wd, save = TRUE) {
      .Deprecated()
        new_wd <- path.expand(new_wd)
        if (!(getwd() %in% new_wd)) {
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





#' Revert wd back to original wd
#' @description This function restores the original working directory when saved using the change_wd function.
#' @export



revert_wd <-
        function(save = TRUE) {
          .Deprecated()
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















#' Creates folder in working dir if doesn't exist
#' @param folder_name name of the directory
#' @export
#'
create_dir_if_not_exist <-
        function(folder_name) {
                .Deprecated()
                if (!(dir.exists(folder_name))) {
                        dir.create(folder_name)
                }
        }





#' Removes a file if it exists
#' @export

remove_files_if_exist <-
        function(full_file_paths) {

                .Deprecated(new = "file.remove_if_exists")
                for (i in 1:length(full_file_paths)) {
                        full_file_path <- full_file_paths[i]
                        if (file.exists(full_file_path)) {
                                file.remove(full_file_path)
                        }
                }
        }










