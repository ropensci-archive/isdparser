context("isd_parse_line")

test_that("isd_parse_line", {
  path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
  lns <- readLines(path, encoding = "latin1")

  aa <- isd_parse_line(lns[1])

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_type(aa$total_chars, "double")
  expect_type(aa$usaf_station, "character")
  expect_type(aa$wban_station, "character")
  expect_type(aa$date, "double")
  expect_type(aa$time, "character")

  bb <- isd_parse_line(lns[1], as_data_frame = FALSE)

  expect_is(bb, "list")
  expect_type(aa$total_chars, "double")
  expect_type(aa$usaf_station, "character")
  expect_type(aa$wban_station, "character")
  expect_type(aa$date, "double")
  expect_type(aa$time, "character")
})

test_that("isd_parse_line fails well", {
  expect_error(isd_parse_line(),
               "argument \"x\" is missing")
  expect_error(isd_parse_line(5),
               "'x' must be class character")
})
