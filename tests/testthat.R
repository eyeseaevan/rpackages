Sys.setenv("R_TESTS" = "")
library(testthat)
library(rpackages)

testthat::test_dir('tests/testthat')
