#' @noRd

file_date_ff <-
  function(file_info_col = c(
             "size",
             "isdir",
             "mode",
             "mtime",
             "ctime",
             "atime",
             "uid",
             "gid",
             "uname",
             "grname"
           )) {
    function(...) {


      # ---
      # Base File Info
      # ---
      file.info_df <-
        file.info(...,
          extra_cols = TRUE
        )

      # ---
      # Convert Row Names (File Paths) to Columns
      # ---
      files <- row.names(file.info_df)
      info <- file.info_df[, file_info_col]

      output <-
        data.frame(
          file = files,
          info = info,
          stringsAsFactors = FALSE
        )

      # ---
      # Convert Row Names (File Paths) to Columns
      # ---
      colnames(output) <- c("file", file_info_col)

      output
    }
  }

#' @title
#' Get File Size in KB
#'
#' @inheritParams base::file.size
#'
#' @return
#' Dataframe of file path and size
#'
#' @rdname get_kb_size
#'
#' @export

get_kb_size <-
  function(...) {
    file_bytes_f <- file_date_ff(file_info_col = "size")

    file_bytes <-
      file_bytes_f(...)

    data.frame(
      file = file_bytes$file,
      kb = file_bytes$size / (10^3),
      stringsAsFactors = FALSE
    )
  }


#' @title
#' Get File Size in MB
#'
#' @inheritParams base::file.size
#'
#' @return
#' Dataframe of file path and size
#'
#' @rdname get_mb_size
#'
#' @export

get_mb_size <-
  function(...) {
    file_bytes_f <- file_date_ff(file_info_col = "size")

    file_bytes <-
      file_bytes_f(...)

    data.frame(
      file = file_bytes$file,
      mb = file_bytes$size / (10^6),
      stringsAsFactors = FALSE
    )
  }

#' @title
#' Get File Size in GB
#'
#' @inheritParams base::file.size
#'
#' @return
#' Dataframe of file path and size
#'
#' @rdname get_gb_size
#'
#' @export

get_gb_size <-
  function(...) {
    file_bytes_f <- file_date_ff(file_info_col = "size")

    file_bytes <-
      file_bytes_f(...)

    data.frame(
      file = file_bytes$file,
      gb = file_bytes$size / (10^9),
      stringsAsFactors = FALSE
    )
  }
