Sys.setenv("R_TESTS" = "")
library(devtools)
library(rpackages)

devtools::test('tests/testthat')