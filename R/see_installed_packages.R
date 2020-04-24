#' Return vector of installed packages
#'@export
#'
see_installed_packages <-
        function() {
                return(installed.packages()[,"Package"])
        }
