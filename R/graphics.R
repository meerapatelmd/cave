#' Create Package Logo
#' @importFrom hexSticker sticker
#' @inheritParams hexSticker::sticker
#' @export


createLogo <-
  function(sourceImg,
           package,
           file,
           white_around_sticker = TRUE,
           ...) {
    hexSticker::sticker(sourceImg,
      package = package,
      filename = file,
      white_around_sticker = white_around_sticker,
      ...
    )
  }





#' Create Package Logo
#' @importFrom hexSticker sticker
#' @export


createLogo <-
  function(sourceImg,
           package,
           file,
           white_around_sticker = TRUE,
           ...) {
    hexSticker::sticker(sourceImg,
      package = package,
      filename = file,
      white_around_sticker = white_around_sticker,
      ...
    )
  }





#' Build and Move Favicons
#' @description
#' This package first runs the build_favicons() function in the pkgdown package, which auto-detects a logo.svg or logo.png file and runs it through an API. The function makes a copy of the favicon output to the "man/figures" directory for use.
#' @importFrom pkgdown build_favicons
#' @export

makeFavicons <-
  function() {
    pkgdown::build_favicons()
    create_dir_if_not_exist("man")
    create_dir_if_not_exist("man/figures")

    filesToCopy <- list.files("pkgdown/favicon", full.names = TRUE)
    newFiles <- paste0("man/figures/", basename(filesToCopy))
    invisible(
      mapply(file.copy,
        from = filesToCopy,
        to = newFiles
      )
    )
  }
