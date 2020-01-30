# Temperature Data --------------------------------

# EXTREME-AIR-TEMPERATURE
# KA1-KA4
nms_ka = c('extreme_temp','period_quantity','max_min','temp',
  'temp_quality')
ka <- list(
  ids = paste0("KA", 1:4),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 13),
      list(c(1,3),c(4,6),c(7,7),c(8,12),c(13,13)),
      nms_ka
    )
  }
)

# AVERAGE-AIR-TEMPERATURE
# KB1-KB3
nms_kb = c('avg_temp','period_quantity','temp_code','temp',
  'temp_quality')
kb <- list(
  ids = paste0("KB", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 13),
      list(c(1,3),c(4,6),c(7,7),c(8,12),c(13,13)),
      nms_kb
    )
  }
)

# EXTEME-AIR-TEMPERATURE FOR THE MONTH
# KC1-KC3
nms_kc = c('extreme_temp_month', 'code', 'condition_code',
        'temp', 'dates', 'temp_quality')
kc <- list(
  ids = paste0("KC", 1:3),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 17),
      list(c(1,3),c(4,4),c(5,5),c(6,10),c(11,16),c(17,17)),
      nms_kc
    )
  }
)

# HEATING-COOLING-DEGREE-DAYS
# KD1-KD2
nms_kd = c('heating_cooling_degree_days',
        'period_quantity', 'code',
        'days', 'days_quality')
kd <- list(
  ids = paste0("KD", 1:2),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 12),
      list(c(1,3),c(4,6),c(7,7),c(8,11),c(12,12)),
      nms_kd
    )
  }
)

# EXTREME TEMPERATURES, NUMBER OF DAYS EXCEEDING CRITERIA, FOR THE MONTH
# KE1
nms_ke1 = c('extreme_temp_days_exceeding_criteria',
        'number_days_max_temp_32lower',
        'number_days_max_temp_32lower_quality',
        'number_days_max_temp_90higher',
        'number_days_max_temp_90higher_quality',
        'number_days_min_temp_32lower',
        'number_days_min_temp_32lower_quality',
        'number_days_min_temp_0lower',
        'number_days_min_temp_0lower_quality'
      )
ke1 <- list(
  ids = "KE1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 15),
      list(c(1,3),c(4,5),c(6,6),c(7,8),c(9,9),c(10,11),c(12,12),c(13,14),c(15,15)),
      nms_ke1
    )
  }
)

# Hourly Calculated Temperature
# KF1
nms_kf1 = c('hourly_calculated_temp',
        'derived_air_temp',
        'derived_air_temp_quality'
      )
kf1 <- list(
  ids = "KF1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 9),
      list(c(1,3),c(4,8),c(9,9)),
      nms_kf1
    )
  }
)

# Hourly Calculated Temperature
# KG1-KG2
nms_kg = c('average_dew_point_wet_bulb_trt',
        'time_quantity',
        'code',
        'avg_temp',
        'derived_code',
        'quality_code'
      )
kg <- list(
  ids = paste0("KG", 1:2),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 14),
      list(c(1,3),c(4,6),c(7,7),c(8,12),c(13,13),c(14,14)),
      nms_kg
    )
  }
)
