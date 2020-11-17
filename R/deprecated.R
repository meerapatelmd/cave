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



































#' Replace the Extension of a Filename
#' @param original_fn Original filename including extension. For example, "IngestionFile.xlsx".
#' @param replace_ext Extension to replace the original filename's extension with. For example, "csv".
#' @importFrom stringr str_replace_all
#' @export

replace_ext <-
    function(original_fn,
             replace_ext) {

            .Deprecated("swap_ext")

                paste0(
                stringr::str_replace_all(original_fn,
                                         pattern = "(^.*)([.]{1}.*$)",
                                         replacement = "\\1."),
                    replace_ext)


    }










#' Returns the script step number
#' @description returns the first 2 digits of the present R script filename
#' @importFrom stringr str_replace_all
#' @export


script_step_number <-
    function() {
        return(stringr::str_replace_all(strip_fn(present_script_path()), "([0-9]{2})(.*$)", "\\1"))
    }










#' Interactively select a file
#' @description Interactively select a file based on a menu printed into a console.
#' @importFrom secretary typewrite
#' @importFrom tibble tibble
#' @export

select_file <-
    function(dir, new_obj_name = NULL, full_path = FALSE) {

            .Deprecated()
            fns <-
                    dir %>%
                    list.files()

            print(tibble::tibble(Index = paste0("[", 1:length(fns), "]"),
                        Files = fns))

            secretary::typewrite("Please select a file by Index.")
            answer <- readline("Selection: ")
            answer <- as.integer(answer)
            if (is.null(new_obj_name)) {
                    if (full_path == FALSE) {
                            return(fns[answer])
                    } else {
                            return(paste0(dir, "/", fns[answer]))
                    }
            } else {
                    if (full_path == FALSE) {
                            assign(new_obj_name,
                                   value = fns[answer],
                                   envir = globalenv())
                    } else {
                            assign(new_obj_name,
                                   value = paste0(dir, "/", fns[answer]),
                                   envir = globalenv())
                    }
            }
    }










#' @title Function FileName
#' @description
#' This function compares the name of the file in the R subdir within the working directory and with the name of the function within the file.
#' @return
#' dataframe with `fileName` and `functionName` columns
#' @seealso
#'  \code{\link[purrr]{map}},\code{\link[purrr]{set_names}}
#'  \code{\link[readr]{read_lines}}
#'  \code{\link[stringr]{str_remove}}
#'  \code{\link[rubix]{vector_to_tibble}}
#'  \code{\link[dplyr]{bind}},\code{\link[dplyr]{mutate}}
#' @rdname FunctionFileName
#' @export
#' @importFrom purrr map set_names
#' @importFrom readr read_lines
#' @importFrom stringr str_remove_all
#' @importFrom tibble tibble
#' @importFrom dplyr bind_rows mutate %>%

FunctionFileName  <-
        function() {

                .Deprecated()
                new_col <- "functionName"

                list.files("R", full.names = TRUE) %>%
                        purrr::map(readr::read_lines) %>%
                        purrr::map(function(x) grep(pattern = "<-",
                                                    x,
                                                    value = TRUE)[1]) %>%
                        purrr::map(function(x) stringr::str_remove_all(x, "[ ]{0,}[<]{1}[-]{1}[ ]{0,1}$")) %>%
                        purrr::set_names(list.files("R")) %>%
                        purrr::map(function(x) tibble::tibble(`:=`(!!new_col, x))) %>%
                        dplyr::bind_rows(.id = "fileName") %>%
                        dplyr::mutate(fileName = stringr::str_remove_all(fileName, pattern = "[.]{1}R$"))
        }










#' @title Duplicate Functions
#' @seealso
#'  \code{\link[purrr]{map}},\code{\link[purrr]{set_names}}
#'  \code{\link[readr]{read_lines}}
#'  \code{\link[stringr]{str_remove}}
#'  \code{\link[rubix]{vector_to_tibble}}
#'  \code{\link[dplyr]{bind}},\code{\link[dplyr]{mutate}},\code{\link[dplyr]{group_by}},\code{\link[dplyr]{summarise}},\code{\link[dplyr]{arrange}},\code{\link[dplyr]{filter}}
#' @rdname duplicateFunctions
#' @export
#' @importFrom purrr map set_names
#' @importFrom readr read_lines
#' @importFrom stringr str_remove_all
#' @importFrom tibble tibble
#' @importFrom dplyr bind_rows mutate group_by summarize arrange ungroup filter %>%

duplicateFunctions <-
        function() {

          .Deprecated()

                new_col <- "functionName"

                list.files("R", full.names = TRUE) %>%
                        purrr::map(readr::read_lines) %>%
                        purrr::map(function(x) grep(pattern = "<-",
                                                    x,
                                                    value = TRUE)[1]) %>%
                        purrr::map(function(x) stringr::str_remove_all(x, "[ ]{0,}[<]{1}[-]{1}[ ]{0,1}$")) %>%
                        purrr::set_names(list.files("R")) %>%
                        purrr::map(function(x) tibble::tibble(`:=`(!!new_col, x))) %>%
                        dplyr::bind_rows(.id = "fileName") %>%
                        dplyr::mutate(fileName = stringr::str_remove_all(fileName, pattern = "[.]{1}R$")) %>%
                        dplyr::group_by(functionName) %>%
                        dplyr::summarize(n = n(), .groups = "drop") %>%
                        dplyr::arrange(n) %>%
                        dplyr::ungroup() %>%
                        dplyr::filter(n > 1)
        }





