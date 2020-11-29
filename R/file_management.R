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
           no.. = FALSE) {
    if (missing(output_file)) {
      stop("`output_file` argument is missing")
    }

    if (file.exists(output_file)) {
      stop(sprintf(
        "output_file '%s' already exists",
        output_file
      ),
      call. = FALSE
      )
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
      stop(sprintf(
        "no files found that match pattern '%s' in path '%s'.",
        pattern,
        path
      ))
    }



    cat("",
      file = output_file,
      append = FALSE
    )


    for (i in seq_along(files)) {
      file <- files[i]
      output <- readLines(
        con = file,
        warn = FALSE
      )

      cat(output,
        file = output_file,
        sep = "\n",
        append = TRUE
      )

      cat(separator,
        file = output_file,
        append = TRUE
      )

      if (remove_files) {
        file.remove(file)
      }
    }
  }


#' @title
#' Append Text in One File to Another
#'
#' @description
#' Aggregate text from multiple files into an existing text file with the option to delete the originating file.
#'
#' @export


move_text_to <-
  function(to,
           ...,
           remove_files = FALSE,
           separator = "\n\n\n\n\n") {
    stopifnot(file.exists(to))

    cat(separator,
      file = to,
      append = TRUE
    )

    files <- unlist(rlang::list2(...))

    for (i in seq_along(files)) {
      file <- files[i]
      output <- readLines(
        con = file,
        warn = FALSE
      )

      cat(output,
        file = to,
        sep = "\n",
        append = TRUE
      )

      cat(separator,
        file = to,
        append = TRUE
      )

      if (remove_files) {
        file.remove(file)
      }
    }
  }





#' @title
#' Find Files with Text that Matches a Pattern
#'
#' @description
#' Find files in a path that contains text that matches a pattern. The files in the given path can also be optionally subset based on a pattern of its own before the files are read into the caller environment, useful feature for cases where the path contains a mix of different file types and only text files need to be read.
#'
#' @inheritParams base::grepl
#' @inheritParams base::list.files
#'
#' @rdname grepl_text_files
#'
#' @export


grepl_text_files <-
  function(
           path = ".",
           file_pattern = NULL,
           all.files = FALSE,
           recursive = FALSE,
           text_pattern,
           ignore.case = TRUE,
           perl = FALSE,
           fixed = FALSE,
           useBytes = FALSE) {

    # Immutable list.files() args
    full.names <- TRUE
    include.dirs <- FALSE


    # Immutable grepl() args
    value <- TRUE


    files <-
      list.files(
        path = path,
        pattern = file_pattern,
        all.files = all.files,
        full.names = full.names,
        recursive = recursive,
        ignore.case = ignore.case,
        include.dirs = include.dirs
      )


    output <- vector()

    for (file in files) {
      input <-
        readLines(con = file)


      if (any(grepl(
        pattern = text_pattern,
        x = input,
        ignore.case = ignore.case,
        perl = perl,
        fixed = fixed,
        useBytes = useBytes
      ))) {
        output <-
          c(
            output,
            file
          )
      }
    }


    output
  }



#' @title
#' Find R Directory Files that Match a Pattern
#'
#' @description
#' Convenience wrapper around `grepl_text_files()` for an R directory within the current working directory from which the function is being called.
#'
#' @rdname grepl_r_dir
#' @export


grepl_r_dir <-
  function(recursive = FALSE,
           text_pattern,
           ignore.case = TRUE,
           perl = FALSE,
           fixed = FALSE,
           useBytes = FALSE) {
    path <- "R"
    file_pattern <- "[.]{1}R$"


    grepl_text_files(
      path = path,
      file_pattern = file_pattern,
      recursive = recursive,
      text_pattern = text_pattern,
      ignore.case = ignore.case,
      perl = perl,
      fixed = fixed,
      useBytes = useBytes
    )
  }




#' @title
#' Delete if the File Exists
#'
#' @description
#' Avoid throwing an error if a call to `file.remove()` is to a file does not exist by adding a conditional statement. A message is returned in the console for each file to confirm deletion or if the file was not found.
#'
#' @export


file.remove_if_exists <-
  function(...) {
    files <- rlang::list2(...)

    for (i in 1:seq_along(files)) {
      if (file.exists(files[i])) {
        file.remove(files[i])

        message(sprintf("'%s' removed", files[i]))
      } else {
        message(sprintf("'%s' not found", files[i]))
      }
    }
  }
