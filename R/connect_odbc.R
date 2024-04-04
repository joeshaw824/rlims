#' Connect to a database via odbc
#'
#' @param db Defaults to "moldb" which is the DNA Database.
#'
#' @return Returns an odbc connection.
#' @export
#'
#' @examples
#' connect_odbc()
connect_odbc <- function(db = "moldb") {
  
  DBI::dbConnect(
    drv = odbc::odbc(),
    dsn = {{ db }})

}
  
  