#' Parse neoplastic cell content from character strings
#'
#' @param input_string A character string containing the NCC value
#'
#' @return A character string with mathematical operators
#' @export
#'
#' @examples
#' x <- "NCC of the FFPE sample was >20%. Sample arrived 04/04/2024"
#' parse_ncc(x)
parse_ncc <- function(input_string) {
  
  ncc_regex <- stringr::regex(
    r"[
  (>\d{2}% | \d{2}-\d{2}%)
  ]",
  comments = TRUE
  )
  
  ncc <- stringr::str_extract(string = input_string, 
                     pattern = ncc_regex, 
                     group = 1)
  
  return(ncc)
  
}