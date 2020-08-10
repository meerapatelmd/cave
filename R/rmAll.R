#' Remove Objects from the Global Environment
#' @export

rmAll <-
        function(except = NULL) {

                allObjs <- ls(envir = globalenv())

                if (is.null(except)) {

                        rm(list = allObjs,
                           envir = globalenv())

                } else {

                        someObjs <- allObjs[!(allObjs %in% except)]
                        rm(list = someObjs,
                           envir = globalenv())
                }
        }
