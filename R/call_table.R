#' Call a table from DLIMS
#'
#'`call_table()` calls a table from DLIMS and cleans the column names with 
#'`janitor::clean_names()` into snake case to make it easier to work with. 
#'`call_table()` can be combined with dplyr
#'functions like `filter()` and `select()`, and the table can be called into your 
#'environment with `collect()`.
#'
#' @param table The table you want to work with
#'
#' @return Returns the database query with lazy evaluation but does not call it 
#'     into your environment as a dataframe.
#' @export
#'
#' @examples
#' call_table(table = "NGISCodes") |> 
#' dplyr::collect()
call_table <- function(table) {
  
  output <- dplyr::tbl(connect_odbc(), 
                dbplyr::in_catalog(catalog = "MolecularDB",
                                  schema = "dbo",
                                  table = {{ table }})) |> 
    janitor::clean_names()
  
  return(output)
  
}