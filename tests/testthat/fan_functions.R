library(testthat)
library(rpackages)
library(maps)

test_that("Functions are returning correct objects", {
  is_a(fars_read("accident_2015"), data.frame)
  is_a(make_filename(2015), string)
  is_a(fars_read_years(c(2014, 2015)), data.frame)
  is_a(fars_summarize_years(2015), data.frame)
  is_a(fars_map_state(1,2015), maps::map)
})
