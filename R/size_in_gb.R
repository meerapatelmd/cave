#' Filesize in GB
#' @param full_fn vector of full file paths
#' @export

size_in_gb <-
  function(full_fns) {
              return((file.size(full_fns))/1e9)
  }
