#' Show all the tables in DLIMS
#'
#'`all_tables()` shows all the table objects within the DLIMS database. It's a useful
#'function for navigating around the database, and can be used alongside `get_columns()`
#'to understand how each table is structured.
#'
#' @return A dataframe of table objects
#' @export
#'
#' @examples
#' all_tables()
all_tables <- function() {
  
  output <- odbc::odbcListObjects(connect_odbc(),
                      catalog = "MolecularDB",
                      schema = "dbo",
                      type = "table")
  
  return(output)
  
}