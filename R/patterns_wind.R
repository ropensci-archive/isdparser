# Wind Data --------------------------------

# Wind Data: SUPPLEMENTARY-WIND-OBSERVATION
# OA1-OA3
nms_oa = c('supplementary_wind_observation_identifier',
        'type_code', 'period_quantity', 'speed_rate',
        'speed_rate_quality_code')
oa <- list(
  ids = paste0("OA", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 11),
      list(c(1,3),c(4,4),c(5,6),c(7,10),c(11,11)),
      nms_oa
    )
  }
)


# Wind Data: Hourly/Sub-Hourly Wind Section
# OB1-OB2
nms_ob = c('hourly_sub_hourly_wind_section_identifier',
        'wind_avg_time', 'maximum_gust', 'wind_max_quality_code',
        'wind_max_flag', 'wind_max_direction',
        'wind_max_direction_quality_code', 'wind_max_direction_flag',
        'wind_standard_deviation', 'wind_standard_deviation_quality_code',
        'wind_standard_deviation_flag',
        'wind_direction_standard_deviation', 'wind_direction_quality_code',
        'wind_direction_flag')
ob <- list(
  ids = paste0("OB", 1:2),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 31),
      list(c(1,3),c(4,6),c(7,10),c(11,11),c(12,12),c(13,15),c(16,16),
           c(17,17),c(18,22),c(23,23),c(24,24),c(25,29),c(30,30),c(31,31)),
      nms_ob
    )
  }
)

# Wind Data: WIND-GUST-OBSERVATION
# OC1
nms_oc1 = c('wind_gust_observation_identifier', 'speed_rate', 'quality_code')
oc1 <- list(
  ids = "OC1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 8),
      list(c(1,3),c(4,7),c(8,8)),
      nms_oc1
    )
  }
)

# Wind Data: SUPPLEMENTARY-WIND-OBSERVATION
# OD1-OD3
nms_od1 = c('supplementary_wind_observation_identifier',
        'type_code', 'period_quantity', 'speed_rate',
        'speed_rate_quality_code', 'direction_quantity')
od1 <- list(
  ids = paste0("OD", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 14),
      list(c(1,3),c(4,4),c(5,6),c(7,10),c(11,11),c(12,14)),
      nms_od1
    )
  }
)

# Wind Data: SUMMARY-OF-DAY-WIND-OBSERVATION
# OE1-OE3
nms_oe = c('summary_of_day_wind_observation_identifier',
        'type_code', 'period_quantity', 'speed_rate',
        'direction_of_wind', 'time_of_occurrence_in_z_time_utc',
        'quality_code')
oe <- list(
  ids = paste0("OE", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 19),
      list(c(1,3),c(4,4),c(5,6),c(7,11),c(12,14),c(15,18),c(19,19)),
      nms_oe
    )
  }
)

# Relative Humidity -------------------------

# RELATIVE HUMIDITY
# RH1-RH3
nms_rh = c('relative_humidity',
        'period_quantity', 'code',
        'relative_humidity_percent',
        'relative_humidity_derived_code',
        'relative_humidity_quality_code')
rh <- list(
  ids = paste0("RH", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 12),
      list(c(1,3),c(4,6),c(7,7),c(8,10),c(11,11),c(12,12)),
      nms_rh
    )
  }
)
