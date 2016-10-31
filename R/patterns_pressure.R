# Pressure Data --------------------------------

# pressure data
# ma1(x)
ma1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 15),
    list(c(1,3),c(4,8),c(9,9),c(10,14),c(15,15)),
    c('atmospheric_pressure','altimeter_setting_rate',
      'altimeter_quality_code','station_pressure_rate',
      'station_pressure_quality_code')
  )
}

# atmospheric pressure change
# md1(x)
md1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 14),
    list(c(1,3),c(4,4),c(5,5),c(6,8),c(9,9),c(10,13),c(14,14)),
    c('atmospheric_change','tendency','tendency_quality',
      'three_hr','three_hr_quality',
      'twentyfour_hr','twentyfour_hr_quality')
  )
}

# PRESENT-WEATHER-OBSERVATION manual occurrence identifier,
# MW1=first weather reported
# mw1(x)
mw1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 6),
    list(c(1,3),c(4,5),c(6,6)),
    c('first_weather_reported','condition','condition_quality')
  )
}
