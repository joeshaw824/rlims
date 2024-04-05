#' Call a table from DLIMS
#'
#' @param table The table you want to work with
#'
#' @return Returns the table but does not call it into your environment
#' @export
#'
#' @examples
#' call_table(table = "MOL_ExtractionMethods") |> 
#' dplyr::select(-c(checks, reagents)) |> 
#' dplyr::collect()
call_table <- function(table) {
  
  output <- dplyr::tbl(connect_odbc(), 
                dbplyr::in_catalog(catalog = "MolecularDB",
                                  schema = "dbo",
                                  table = {{ table }})) |> 
    janitor::clean_names()
  
  return(output)
  
}