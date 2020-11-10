#' @title
#' Combine Text File Contents into a Single File
#'
#' @description
#' Read text from a list of files with names matching a pattern, combine into a single output file. An error will be thrown if the output file already exists.
#'
#' @section Use Cases:
#' In R package file management, sometimes R directory files need to be grouped into function families. This can be done by using this function to first write the group of functions to a new file.
#'
#' @inheritParams base::list.files
#' @param output_file           Path to a file that combined files will be written to. This file will not be overwritten if it already exists.
#' @param separator             Pattern that separates the text from the other files in the combined output.
#' @param remove_files          If TRUE, removes each file after it is appended to the `output_file`. Defaults to FALSE.
#'
#' @rdname combine_text_files
#' @export

combine_text_files <-
        function(path = ".",
                 pattern,
                 output_file,
                 separator = "\n\n\n\n\n",
                 remove_files = FALSE,
                 all.files = FALSE,
                 recursive = FALSE,
                 ignore.case = FALSE,
                 include.dirs = FALSE,
                 no.. = FALSE)  {

                if (missing(output_file)) {

                        stop("`output_file` argument is missing")

                }

                if (file.exists(output_file)) {

                        stop(sprintf("output_file '%s' already exists",
                                     output_file),
                             call. = FALSE)

                }

                full.names <- TRUE

                files <-
                        list.files(
                                path = path,
                                pattern = pattern,
                                all.files = all.files,
                                full.names = full.names,
                                recursive = recursive,
                                ignore.case = ignore.case,
                                include.dirs = include.dirs,
                                no.. = no..
                        )

                if (length(files) == 0) {

                        stop(sprintf("no files found that match pattern '%s' in path '%s'.",
                                     pattern,
                                     path))

                }



                cat("",
                    file = output_file,
                    append = FALSE)


                for (i in seq_along(files)) {

                        file <- files[i]
                        output <- readLines(
                                        con = file,
                                        warn = FALSE
                                        )

                        cat(output,
                            file = output_file,
                            sep = "\n",
                            append = TRUE)

                        cat(separator,
                            file = output_file,
                            append = TRUE)

                        if (remove_files) {

                                file.remove(file)

                        }

                }


        }
