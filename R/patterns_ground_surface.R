# Ground Surface Data --------------------------------

# GROUND-SURFACE-OBSERVATION
# IA1
nms_ia1 = c('ground_surface', 'ground_surface_code',
  'ground_surface_code_quality')
ia1 <- list(
  ids = "IA1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 6),
      list(c(1,3),c(4,5),c(6,6)),
      nms_ia1
    )
  }
)

# GROUND-SURFACE-OBSERVATION minimum-temperature
# IA2
nms_ia2 = c('ground_surface_minimum', 'time_period_hrs',
  'min_tmp', 'min_tmp_quality')
ia2 <- list(
  ids = "IA2",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 12),
      list(c(1,3),c(4,6),c(7,11),c(12,12)),
      nms_ia2
    )
  }
)

# Hourly Surface Temperature Section
# IB1
nms_ib1 = c('hourly_surface_temp',
        'hourly_avg_surface_temp',
        'hourly_avg_surface_temp_quality',
        'hourly_avg_surface_temp_flag',
        'hourly_min_surface_temp',
        'hourly_min_surface_temp_quality',
        'hourly_min_surface_temp_flag',
        'hourly_max_surface_temp',
        'hourly_max_surface_temp_quality',
        'hourly_max_surface_temp_flag',
        'hourly_std_surface_temp',
        'hourly_std_surface_temp_quality',
        'hourly_std_surface_temp_flag'
      )
ib1 <- list(
  ids = "IB1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 30),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,15),c(16,16),c(17,17),c(18,22),
           c(23,23),c(24,24),c(25,28),c(29,29),c(29,29)),
      nms_ib1
    )
  }
)

# Hourly Surface Temperature Sensor Section
# IB2
nms_ib2 = c('hourly_surface_temp_sensor',
        'equipment_temp',
        'equipment_temp_quality',
        'equipment_temp_flag',
        'equipment_temp_std',
        'equipment_temp_std_quality',
        'equipment_temp_std_flag'
      )
ib2 <- list(
  ids = "IB2",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 16),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,14),c(15,15),c(16,16)),
      nms_ib2
    )
  }
)


# GROUND-SURFACE-OBSERVATION pan evaporation data
# IC1
nms_ic1 = c('pan_evaporation',
        'time_period_hrs',
        'wind_movement',
        'wind_movement_condition_code',
        'wind_movement_quality_code',
        'evaporation_total',
        'evaporation_total_condition_code',
        'evaporation_total_quality_code',
        'max_pan_water_temp',
        'max_pan_water_temp_condition_code',
        'max_pan_water_temp_quality_code',
        'min_pan_water_temp',
        'min_pan_water_temp_condition_code',
        'min_pan_water_temp_quality_code'
      )
ic1 <- list(
  ids = "IC1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 28),
      list(c(1,3),c(4,5),c(6,9),c(10,10),c(11,11),c(12,14),c(15,15),c(16,16),
           c(17,20),c(21,21),c(22,22),c(23,26),c(27,27),c(28,28)),
      nms_ic1
    )
  }
)
