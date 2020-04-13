# data-raw/mydataset.R
# Data import and processing pipeline
library(readr)
library(usethis)

accident_2013 <- readr::read_csv("inst/extdata/accident_2013.csv.bz2")
accident_2014 <- readr::read_csv("inst/extdata/accident_2014.csv.bz2")
accident_2015 <- readr::read_csv("inst/extdata/accident_2015.csv.bz2")

# Data processing code here...

# This should be the last line.
# Note that names are unquoted.
# I like using overwrite = T so everytime I run the script the 
# updated objects are saved, but the default is overwrite = F
usethis::use_data(accident_2013, accident_2014, accident_2015, overwrite = T)