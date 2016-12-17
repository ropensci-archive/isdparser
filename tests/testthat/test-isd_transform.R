context("isd_transform")

path <- system.file('extdata/104270-99999-1928.gz', package = "isdparser")

test_that("isd_transform works", {
  dat <- suppressMessages(isd_parse(path))
  aa <- isd_transform(dat)

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")

  expect_type(dat$total_chars, "character")
  expect_type(aa$total_chars, "double")

  expect_is(dat$date, "character")
  expect_is(aa$date, "Date")

  expect_type(dat$latitude, "character")
  expect_type(aa$latitude, "double")

  expect_type(dat$elevation, "character")
  expect_type(aa$elevation, "double")

  expect_type(dat$longitude, "character")
  expect_type(aa$longitude, "double")

  expect_type(dat$wind_speed, "character")
  expect_type(aa$wind_speed, "double")

  expect_type(dat$temperature, "character")
  expect_type(aa$temperature, "double")

  expect_type(dat$air_pressure, "character")
  expect_type(aa$air_pressure, "double")
})

test_that("isd_transform fails well", {
  expect_error(isd_transform(),
               "argument \"x\" is missing")
  expect_error(isd_transform('xx'),
               "no 'isd_transform' method for character")
  expect_error(isd_transform(matrix()),
               "no 'isd_transform' method for matrix")
})
