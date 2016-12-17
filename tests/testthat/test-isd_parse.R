context("isd_parse")

path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")

test_that("isd_parse", {
  aa <- suppressMessages(isd_parse(path))

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_type(aa$total_chars, "character")
  expect_type(aa$usaf_station, "character")
  expect_type(aa$wban_station, "character")
  expect_type(aa$date, "character")
  expect_type(aa$time, "character")

  expect_equal(NCOL(aa), 42)
  expect_true(any(grepl("REM", names(aa))))
})

test_that("isd_parse - additional param works", {
  aa <- suppressMessages(isd_parse(path, additional = FALSE))

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_type(aa$total_chars, "character")
  expect_type(aa$usaf_station, "character")
  expect_type(aa$wban_station, "character")
  expect_type(aa$date, "character")
  expect_type(aa$time, "character")

  expect_equal(NCOL(aa), 31)
  expect_false(any(grepl("REM", names(aa))))
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
