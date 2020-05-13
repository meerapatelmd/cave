#' Parse and evaluate a string
#' @description This is the counterpart function of vector_to_string in this package.
#' @export


string_to_vector <-
    function(string) {
        parsed_expr <- rlang::parse_expr(string)
        return(eval(parsed_expr))
    }
