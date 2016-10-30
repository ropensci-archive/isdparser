trans_vars <- function(w) {
  # fix scaled variables
  w$latitude <- trans_var(trycol(suppressWarnings(w$latitude)), 1000)
  w$longitude <- trans_var(trycol(suppressWarnings(w$longitude)), 1000)
  w$elevation <- trans_var(trycol(suppressWarnings(w$elevation)), 10)
  w$wind_speed <- trans_var(trycol(suppressWarnings(w$wind_speed)), 10)
  w$temperature <- trans_var(trycol(suppressWarnings(w$temperature)), 10)
  w$temperature_dewpoint <- trans_var(trycol(suppressWarnings(w$temperature_dewpoint)), 10)
  w$air_pressure <- trans_var(trycol(suppressWarnings(w$air_pressure)), 10)
  w$precipitation <- trans_var(trycol(suppressWarnings(w$precipitation)), 10)

  # as date
  w$date <- as.Date(w$date, "%Y%m%d")

  # change class
  w$wind_direction <- as.numeric(w$wind_direction)
  w$total_chars <- as.numeric(w$total_chars)

  return(w)
}

trycol <- function(x) {
  tt <- tryCatch(x, error = function(e) e)
  if (inherits(tt, "error")) NULL else tt
}

trans_var <- function(x, n) {
  if (is.null(x)) {
    x
  } else {
    as.numeric(x)/n
  }
}
