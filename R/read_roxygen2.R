





split_roxygen2_file <-
  function(path) {
    text <- .read_file(path = path)

    strsplit(
      x = text,
      split = "[ ]{1}[#]{1}[']{1}|^[#]{1}[']{1}",
      type = "before"
    )
  }
