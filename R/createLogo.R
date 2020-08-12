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
                                    package=package,
                                    filename = file,
                                    white_around_sticker = white_around_sticker,
                                    ...)

        }
