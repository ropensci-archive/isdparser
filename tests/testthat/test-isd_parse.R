context("isd_parse")

test_that("isd_parse", {
  path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
  aa <- suppressMessages(isd_parse(path))

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_type(aa$total_chars, "double")
  expect_type(aa$usaf_station, "character")
  expect_type(aa$wban_station, "character")
  expect_type(aa$date, "double")
  expect_type(aa$time, "character")
})

test_that("isd_parse fails well", {
  expect_error(isd_parse(),
                 "argument \"path\" is missing")
  expect_error(isd_parse(5),
               "invalid 'file' argument")
  expect_error(isd_parse("asdfafasdf"),
               "file not found")
  ff <- tempfile(fileext = ".txt")
  cat("fafasfasfaszfasdfasdf", file = ff)
})
