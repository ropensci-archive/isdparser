context("isd_parse_csv")

path <- system.file('extdata/00702699999.csv', package = "isdparser")

test_that("isd_parse_csv", {
  aa <- suppressMessages(isd_parse_csv(path))

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_type(aa$station, "integer")
  expect_is(aa$date, "POSIXct")
  expect_type(aa$name, "character")

  expect_gt(NCOL(aa), 38)
  expect_true(any(grepl("rem", names(aa))))
})

test_that("isd_parse_csv fails well", {
  expect_error(isd_parse_csv(),
                 "argument \"path\" is missing")
  expect_error(isd_parse_csv(5))
  expect_error(isd_parse_csv("asdfafasdf"),
               "file not found")
  ff <- tempfile(fileext = ".txt")
  cat("fafasfasfaszfasdfasdf", file = ff)
  expect_warning(suppressMessages(isd_parse_csv(ff)))
})
