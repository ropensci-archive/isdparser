context("isd_parse_line")

path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
lns <- readLines(path, encoding = "latin1")

test_that("isd_parse_line", {
  aa <- isd_parse_line(lns[1])

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_type(aa$total_chars, "character")
  expect_type(aa$usaf_station, "character")
  expect_type(aa$wban_station, "character")
  expect_type(aa$date, "character")
  expect_type(aa$time, "character")
  expect_equal(NCOL(aa), 42)
  expect_true(any(grepl("REM", names(aa))))

  bb <- isd_parse_line(lns[1], as_data_frame = FALSE)

  expect_is(bb, "list")
  expect_type(aa$total_chars, "character")
  expect_type(aa$usaf_station, "character")
  expect_type(aa$wban_station, "character")
  expect_type(aa$date, "character")
  expect_type(aa$time, "character")
  expect_equal(length(bb), 42)
  expect_true(any(grepl("REM", names(bb))))
})

test_that("isd_parse_line - additional param works", {
  aa <- isd_parse_line(lns[1], additional = FALSE)

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_equal(NCOL(aa), 31)
  expect_false(any(grepl("REM", names(aa))))

  bb <- isd_parse_line(lns[1], additional = FALSE, as_data_frame = FALSE)

  expect_is(bb, "list")
  expect_equal(length(bb), 31)
  expect_false(any(grepl("REM", names(bb))))
})

test_that("isd_parse_line fails well", {
  expect_error(isd_parse_line(),
               "argument \"x\" is missing")
  expect_error(isd_parse_line(5),
               "'x' must be class character")
})
