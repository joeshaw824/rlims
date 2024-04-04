
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

The aim of R-LIMS is to simplify and streamline interacting with D-LIMS
at scale, for development projects and for audits.

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

To begin with, set up the ODBC connection.

``` r
library(rlims)

# Set up the odbc connection
connect_odbc()
#> <OdbcConnection> guest@SQLPROD05
#>   Database: master
#>   Microsoft SQL Server Version: 14.00.3465
```
