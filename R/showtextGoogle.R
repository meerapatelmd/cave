#' @title Use Google Font
#' @description
#' This function adds a Google Font from \href{https://fonts.google.com/} and activates the showtext package functionality. This function is particularly useful for using Google Fonts for \code{\link{[createLogo]createLogo}}.
#'
#' @inheritParams sysfonts::font_add_google
#' @seealso
#'  \code{\link[curl]{handle}}
#'  \code{\link[sysfonts]{font_add_google}}
#'  \code{\link[showtext]{showtext_auto}}
#' @rdname showtext_google
#' @export
#' @importFrom curl new_handle
#' @importFrom sysfonts font_add_google
#' @importFrom showtext showtext_auto


showtextGoogle <-
        function(name,
                 regular.wt = 400,
                 bold.wt = 700,
                 repo = "http://fonts.gstatic.com/",
                 db_cache = TRUE,
                 handle = curl::new_handle()) {

                sysfonts::font_add_google(name = name,
                                          regular.wt = regular.wt,
                                          bold.wt = bold.wt,
                                          repo = repo,
                                          db_cache = db_cache,
                                          handle = handle)

                showtext::showtext_auto()

        }
