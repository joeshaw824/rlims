#' Get column names and details for a database table
#'
#' @param table_input Table of interest with no default. 
#' @param connection Connection defaults to odbc connection
#' @param catalog Catalog defaults to "MolecularDB"
#' @param schema Schema defaults to "dbo"
#'
#' @return A dataframe of column names and data types
#' @export
#'
#' @examples
#' get_columns("Discode")
get_columns <- function(table_input,
                        connection = connect_odbc(),
                        catalog = "MolecularDB",
                        schema = "dbo") {
  
  output <- odbc::odbcConnectionColumns(
    conn = {{ connection }}, 
    catalog_name = {{ catalog }},
    schema_name = {{ schema }},
    name = table_input)
  
  return(output)
  
}