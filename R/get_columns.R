#' Get column names and details for a database table
#'
#' @param table_input Table of interest with no default. 
#' @param connection Connection defaults to odbc connection
#' @param catalog Catalog defaults to "MolecularDB"
#' @param schema Schema defaults to "dbo"
#' @param cols String of "narrow" which selects only useful columns, or "all" which
#'     returns all columns.
#' @return A dataframe of column names and data types
#' @export
#'
#' @examples
#' get_columns("Discode")
get_columns <- function(table_input,
                        connection = connect_odbc(),
                        catalog = "MolecularDB",
                        schema = "dbo",
                        cols = "narrow") {
  
  stopifnot(cols %in% c("narrow", "all"))
  
  col_table <- odbc::odbcConnectionColumns(
    conn = {{ connection }}, 
    catalog_name = {{ catalog }},
    schema_name = {{ schema }},
    name = table_input) |> 
    janitor::clean_names() |> 
    dplyr::mutate("clean_name" = janitor::make_clean_names("name")) |> 
    dplyr::relocate("clean_name") 
  
  if (cols == "narrow") {
    
    output <- col_table |> 
      dplyr::select(-c("name", "table_name", "schema_name", "catalog_name", 
                       "decimal_digits", "numeric_precision_radix", 
                       "remarks", "column_default", "sql_data_type", 
                       "sql_datetime_subtype", "ordinal_position", 
                       "nullable", "buffer_length", "char_octet_length"))
    
  }
  
  if (cols == "all") {
    
    output <- col_table
    
  }
  
  return(output)
  
}