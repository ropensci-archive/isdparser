# Network Metadata --------------------------------

# US-NETWORK-METADATA
# CO1
nms_co1 = c('network_metadata', 'climate_division_number', 'time_conversion')
co1 <- list(
  ids = "CO1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 8),
      list(c(1,3),c(4,5),c(6,8)),
      nms_co1
    )
  }
)

# US-COOPERATIVE-NETWORK-ELEMENT-TIME-OFFSET
# CO2-CO9
nms_co = c('network_element_time_offset', 'element_identifier', 'time_offset_hrs')
co <- list(
  ids = paste0("CO", 2:9),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 11),
      list(c(1,3),c(4,6),c(7,11)),
      nms_co
    )
  }
)

# CRN Control Section
# CR1
nms_cr = c('datalogger_identifier', 'datalogger_version',
        'datalogger_version_quality_code',
        'datalogger_version_quality_flag')
cr <- list(
  ids = "CR1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 10),
      list(c(1,3),c(4,8),c(9,9),c(10,10)),
      nms_cr
    )
  }
)

# Subhourly Temperature Section
# CT1-CT3
nms_ct = c('subhourly_temperature',
        'average_air_temperature',
        'average_air_temperature_quality_code',
        'average_air_temperature_quality_flag')
ct <- list(
  ids = paste0("CT", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 10),
      list(c(1,3),c(4,8),c(9,9),c(10,10)),
      nms_ct
    )
  }
)

# Hourly Temperature Section
# CU1-CU3
nms_cu = c('hourly_temperature',
        'average_air_temperature',
        'average_air_temperature_quality_code',
        'average_air_temperature_quality_flag',
        'standard_deviation_air_temperature',
        'standard_deviation_air_temperature_quality_code',
        'standard_deviation_air_temperature_quality_flag')
cu <- list(
  ids = paste0("CU", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 16),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,14),c(15,15),c(16,16)),
      nms_cu
    )
  }
)

# Hourly Temperature Extreme Section
# CV1-CV3
nms_cv = c('hourly_temperature_extreme',
        'min_air_temp_extreme',
        'min_air_temp_extreme_quality_code',
        'min_air_temp_extreme_quality_flag',
        'time_of_min_air_temp_extreme',
        'time_of_min_air_temp_extreme_quality_code',
        'time_of_min_air_temp_extreme_quality_flag',
        'max_air_temp_extreme',
        'max_air_temp_extreme_quality_code',
        'max_air_temp_extreme_quality_flag',
        'time_of_max_air_temp_extreme',
        'time_of_max_air_temp_extreme_quality_code',
        'time_of_max_air_temp_extreme_quality_flag'
      )
cv <- list(
  ids = paste0("CV", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 29),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,14),c(15,15),c(16,16),
           c(17,21),c(22,22),c(23,23),c(24,27),c(28,28),c(29,29)),
      nms_cv
    )
  }
)

# Subhourly Wetness Section
# CW1
nms_cw = c('subhourly_wetness',
        'wetness_indicator_channel1',
        'wetness_indicator_channel1_quality_code',
        'wetness_indicator_channel1_quality_flag',
        'wetness_indicator_channel2',
        'wetness_indicator_channel2_quality_code',
        'wetness_indicator_channel2_quality_flag'
      )
cw <- list(
  ids = "CW1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 17),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,15),c(16,16),c(17,17)),
      nms_cw
    )
  }
)

# Hourly Geonor Vibrating Wire Summary Section
# CX1-CX3
nms_cx = c('geonor_vibrating_wire',
        'precipitation_total',
        'precipitation_total_quality_code',
        'precipitation_total_quality_flag',
        'sensor_average_frequency',
        'sensor_average_frequency_quality_code',
        'sensor_average_frequency_quality_flag',
        'sensor_min_frequency',
        'sensor_min_frequency_quality_code',
        'sensor_min_frequency_quality_flag',
        'sensor_max_frequency',
        'sensor_max_frequency_quality_code',
        'sensor_max_frequency_quality_flag'
      )
cx <- list(
  ids = paste0("CX", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 29),
      list(c(1,3),c(4,9),c(10,10),c(11,11),c(12,15),c(16,16),c(17,17),
           c(18,21),c(22,22),c(23,23),c(24,27),c(28,28),c(29,29)),
      nms_cx
    )
  }
)
