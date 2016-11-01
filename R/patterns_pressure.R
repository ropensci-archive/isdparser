# Pressure Data --------------------------------

# pressure data
# MA1
ma1 <- list(
  ids = "MA1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 15),
      list(c(1,3),c(4,8),c(9,9),c(10,14),c(15,15)),
      c('atmospheric_pressure','altimeter_setting_rate',
        'altimeter_quality_code','station_pressure_rate',
        'station_pressure_quality_code')
    )
  }
)

# atmospheric pressure change
# MD1
md1 <- list(
  ids = "MD1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 14),
      list(c(1,3),c(4,4),c(5,5),c(6,8),c(9,9),c(10,13),c(14,14)),
      c('atmospheric_change','tendency','tendency_quality',
        'three_hr','three_hr_quality',
        'twentyfour_hr','twentyfour_hr_quality')
    )
  }
)

# GEOPOTENTIAL-HEIGHT-ISOBARIC-LEVEL
# ME1
me1 <- list(
  ids = "ME1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 9),
      list(c(1,3),c(4,4),c(5,8),c(9,9)),
      c('geopotential_height_isobaric_level',
        'code','height_dimension',
        'height_dimension_quality')
    )
  }
)

# ATMOSPHERIC-PRESSURE-OBSERVATION (STP/SLP)
# MF1
mf1 <- list(
  ids = "MF1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 15),
      list(c(1,3),c(4,8),c(9,9),c(10,14),c(15,15)),
      c('atmospheric_pressure',
        'avg_pressure','avg_pressure_quality',
        'avg_sea_level_pressure', 'avg_sea_level_pressure_quality')
    )
  }
)

# ATMOSPHERIC-PRESSURE-OBSERVATION
# MG1
mg1 <- list(
  ids = "MG1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 15),
      list(c(1,3),c(4,8),c(9,9),c(10,14),c(15,15)),
      c('atmospheric_pressure',
        'avg_pressure','avg_pressure_quality',
        'min_sea_level_pressure', 'min_sea_level_pressure_quality')
    )
  }
)

# ATMOSPHERIC-PRESSURE-OBSERVATION FOR THE MONTH
# MH1
mh1 <- list(
  ids = "MH1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 15),
      list(c(1,3),c(4,8),c(9,9),c(10,14),c(15,15)),
      c('atmospheric_pressure',
        'avg_pressure','avg_pressure_quality',
        'avg_sea_level_pressure', 'avg_sea_level_pressure_quality')
    )
  }
)

# ATMOSPHERIC-PRESSURE-OBSERVATION FOR THE MONTH
# MK1
mk1 <- list(
  ids = "MK1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 27),
      list(c(1,3),c(4,8),c(9,14),c(15,15),c(16,20),c(21,26),c(27,27)),
      c('atmospheric_pressure',
        'max_sea_level_pressure',
        'max_sea_level_pressure_datetime',
        'max_sea_level_pressure_quality',
        'min_sea_level_pressure',
        'min_sea_level_pressure_datetime',
        'min_sea_level_pressure_quality'
      )
    )
  }
)
