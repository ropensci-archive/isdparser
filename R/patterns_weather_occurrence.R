# Weather Occurrence Data --------------------------------

# PRESENT-WEATHER-OBSERVATION
# AU1-AU9
au <- list(
  ids = paste0("AU", 1:9),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 11),
      list(c(1,3),c(4,4),c(5,5),c(6,7),c(8,8),c(9,9),c(10,10),c(11,11)),
      c('present_weather_observation_identifier_asos_awos',
        'intensity_and_proximity_code', 'descriptor_code',
        'precipitation_code', 'obscuration_code',
        'other_weather_phenomena_code', 'combination_indicator_code',
        'quality_code')
    )
  }
)

# PRESENT-WEATHER-OBSERVATION automated
# AW1-AW4
aw <- list(
  ids = paste0("AW", 1:4),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 6),
      list(c(1,3),c(4,5),c(6,6)),
      c('present_weather_observation_identifier',
        'automated_atmospheric_condition_code',
        'quality_automated_atmospheric_condition_code')
    )
  }
)

# PAST-WEATHER-OBSERVATION summary of day
# AX1-AX6
ax <- list(
  ids = paste0("AX", 1:6),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 9),
      list(c(1,3),c(4,5),c(6,6),c(7,8),c(9,9)),
      c('past_weather_observation_summaryofday',
        'atmospheric_condition_code',
        'quality_manual_atmospheric_condition_code',
        'period_quantity', 'period_quality_code')
    )
  }
)

# PAST-WEATHER-OBSERVATION manual
# AY1-AY2
ay <- list(
  ids = paste0("AY", 1:2),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 8),
      list(c(1,3),c(4,4),c(5,5),c(6,7),c(8,8)),
      c('past_weather_manual','condition_code',
        'condition_quality','period','period_quality')
    )
  }
)

# PAST-WEATHER-OBSERVATION automated
# AZ1-AZ2
az <- list(
  ids = paste0("AZ", 1:2),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 8),
      list(c(1,3),c(4,4),c(5,5),c(6,7),c(8,8)),
      c('past_weather_automated',
        'automated_atmospheric_condition_code',
        'automated_atmospheric_condition_code_quality',
        'period_quantity','period_quality_code')
    )
  }
)

# PRESENT-WEATHER-IN-VICINITY-OBSERVATION
# first weather reported
# MV1-MV7
mv <- list(
  ids = paste0("MV", 1:7),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 6),
      list(c(1,3),c(4,5),c(6,6)),
      c('present_weather','atmospheric_condition_code','condition_quality')
    )
  }
)


# PRESENT-WEATHER-OBSERVATION manual
# first weather reported
# MW1-MW7
mw <- list(
  ids = paste0("MW", 1:7),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 6),
      list(c(1,3),c(4,5),c(6,6)),
      c('first_weather_reported',
        'manual_atmospheric_condition_code','condition_quality')
    )
  }
)
