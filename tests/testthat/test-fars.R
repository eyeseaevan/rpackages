test_that("Functions are returning correct objects", {
  expect_that(fars_read("accident_2015"), is_a("tbl_df"))
  expect_that(make_filename(2015), is_a("character"))
  expect_that(fars_read_years(c(2014, 2015)), is_a("list"))
  expect_that(fars_summarize_years(2015), is_a("tbl_df"))
})