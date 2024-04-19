
<!-- README.md is generated from README.Rmd. Please edit that file -->

# R-LIMS

<!-- badges: start -->
<!-- badges: end -->

R-LIMS is an R package for interacting with D-LIMS. D-LIMS is an
internal SQL database at the Manchester Genomic Laboratory Hub which is
used for logging samples, organising testing, recording results and
writing genetic reports.

R-LIMS consists of useful functions for connecting and querying D-LIMS
with R using an odbc connection, with dplyr queries automatically
converted into SQL queries with the dbplyr package.

R-LIMS aims to simplify and streamline interacting with D-LIMS at scale,
for development projects and for audits.

## Installation

You can install the development version of rlims from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("joeshaw824/rlims")
```

Using rlms requires you have to have to have an ODBC connection to the
DLIMS server already set up on your computer, for which you will need to
be granted permissions by the database owner. Please contact me if you
have any issues with this.

## Example

To begin with, you can set up the ODBC connection which connects to the
server mirror version of the DLIMS database using `connect_odbc()`.

``` r
library(rlims)

# Set up the odbc connection
connect_odbc()
#> <OdbcConnection> guest@SQLPROD05
#>   Database: master
#>   Microsoft SQL Server Version: 14.00.3465

# Check the column names for the "Samples" table
head(get_columns("Samples", cols = "narrow"))
#> Warning: `odbcConnectionColumns()` was deprecated in odbc 1.4.2.
#> ℹ Please use `dbListFields()` instead.
#> ℹ The deprecated feature was likely used in the rlims package.
#>   Please report the issue to the authors.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#>   clean_name field_type data_type column_size
#> 1       name        int         4          10
#> 2       name   nvarchar        -9           8
#> 3       name  datetime2        -9          27
#> 4       name  datetime2        -9          27
#> 5       name   nvarchar        -9          50
#> 6       name   nvarchar        -9          50
```

Alternatively, some functions are stand-alone and are just useful for
the kinds of projects I’ve been working on. For example the parse_ncc
function just pulls out the neoplastic cell content from a string of
text.

``` r
parse_ncc("Tumour neoplastic cell content was 20% but mutation wasn't found")
#> [1] "20%"
```
