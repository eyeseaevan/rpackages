<!-- README.md is generated from README.Rmd. Please edit that file -->

rpackages
=========

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/eyeseaevan/rpackages.svg?branch=master)](https://travis-ci.com/eyeseaevan/rpackages)
<!-- badges: end -->

The goal of rpackages is to complete Coursera’s assignment for building
R packages.

Installation
------------

You can install the released version of rpackages from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("rpackages")
```

Example
-------

This is an example showing how to view fatal car accidents in Florida:

``` r
library(rpackages)
rpackages::fars_map_state(1,2015)
#> [1] "accident_2015"
#> # A tibble: 32,166 x 52
#>    STATE ST_CASE VE_TOTAL VE_FORMS PVH_INVL  PEDS PERNOTMVIT PERMVIT PERSONS
#>    <dbl>   <dbl>    <dbl>    <dbl>    <dbl> <dbl>      <dbl>   <dbl>   <dbl>
#>  1     1   10001        1        1        0     0          0       1       1
#>  2     1   10002        1        1        0     0          0       1       1
#>  3     1   10003        1        1        0     0          0       2       2
#>  4     1   10004        1        1        0     0          0       1       1
#>  5     1   10005        2        2        0     0          0       2       2
#>  6     1   10006        1        1        0     0          0       2       2
#>  7     1   10007        1        1        0     0          0       2       2
#>  8     1   10008        1        1        0     1          1       1       1
#>  9     1   10009        1        1        0     0          0       1       1
#> 10     1   10010        2        2        0     0          0       2       2
#> # ... with 32,156 more rows, and 43 more variables: COUNTY <dbl>, CITY <dbl>,
#> #   DAY <dbl>, MONTH <dbl>, YEAR <dbl>, DAY_WEEK <dbl>, HOUR <dbl>,
#> #   MINUTE <dbl>, NHS <dbl>, RUR_URB <dbl>, FUNC_SYS <dbl>, RD_OWNER <dbl>,
#> #   ROUTE <dbl>, TWAY_ID <chr>, TWAY_ID2 <chr>, MILEPT <dbl>, LATITUDE <dbl>,
#> #   LONGITUD <dbl>, SP_JUR <dbl>, HARM_EV <dbl>, MAN_COLL <dbl>, RELJCT1 <dbl>,
#> #   RELJCT2 <dbl>, TYP_INT <dbl>, WRK_ZONE <dbl>, REL_ROAD <dbl>,
#> #   LGT_COND <dbl>, WEATHER1 <dbl>, WEATHER2 <dbl>, WEATHER <dbl>,
#> #   SCH_BUS <dbl>, RAIL <chr>, NOT_HOUR <dbl>, NOT_MIN <dbl>, ARR_HOUR <dbl>,
#> #   ARR_MIN <dbl>, HOSP_HR <dbl>, HOSP_MN <dbl>, CF1 <dbl>, CF2 <dbl>,
#> #   CF3 <dbl>, FATALS <dbl>, DRUNK_DR <dbl>
```

<img src="man/figures/README-example-1.png" width="100%" />

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub!
