#' Interactively select a file
#' @description Interactively select a file based on a menu printed into a console.
#' @importFrom secretary typewrite
#' @importFrom tibble tibble
#' @export

select_file <-
    function(dir, new_obj_name = NULL, full_path = FALSE) {
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
