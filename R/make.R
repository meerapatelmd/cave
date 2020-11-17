#' Parse and evaluate a string
#' @description This is the counterpart function of vector_to_string in this package.
#' @export


string_to_vector <-
    function(string) {
        parsed_expr <- rlang::parse_expr(string)
        return(eval(parsed_expr))
    }





#' Convert a vector of values into a string
#' @description This function allows to store values neatly in an Excel or other dataframe for summary or record-keeping, but is in a format that can be readily parsed back to an expression if need be. This is important in cases where the names of columns want to be saved for a dataframe in a particular script to reference back or to QA later on. The string can be converted back to a vector by its counterpart function string_to_vector() in this package.
#' @return a parseable string of length one
#' @importFrom stringr str_replace_all
#' @export


vector_to_string <-
    function(vector_to_string) {
        vector_to_string <- as.character(vector_to_string)

        #Enquoting the strings
        vector_to_string <- paste0("'", vector_to_string, "'")

        #Adding commas and bordering with c()
        espresso <- paste0("c(", paste(vector_to_string, collapse = ", "), ")")

        ##For vectors where values were already quoted, the quotes are replaced with single quotes
        expresso <- stringr::str_replace_all(espresso, "\"", "'")

        return(espresso)

    }





