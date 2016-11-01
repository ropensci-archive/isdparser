# Marine Data --------------------------------

# WAVE-MEASUREMENT
# UA1
ua1 <- list(
  ids = "UA1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 13),
      list(c(1,3),c(4,4),c(5,6),c(7,9),c(10,10),c(11,12),c(13,13)),
      c(
        'wave_measurement', 'method_code',
        'wave_period_quantity', 'wave_height_dimension',
        'quality_code', 'sea_state_code', 'sea_state_code_quality'
      )
    )
  }
)

# WAVE-MEASUREMENT primary swell
# UG1
ug1 <- list(
  ids = "UG1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 12),
      list(c(1,3),c(4,5),c(6,8),c(9,11),c(12,12)),
      c(
        'wave_measurement_primary_swell',
        'primary_swell_period_quantity', 'primary_swell_height_dimension',
        'primary_swell_direction_angle', 'primary_swell_quality'
      )
    )
  }
)

# WAVE-MEASUREMENT secondary swell
# UG2
ug2 <- list(
  ids = "UG2",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 12),
      list(c(1,3),c(4,5),c(6,8),c(9,11),c(12,12)),
      c(
        'wave_measurement_secondary_swell',
        'secondary_swell_period_quantity', 'secondary_swell_height_dimension',
        'secondary_swell_direction_angle', 'secondary_swell_quality'
      )
    )
  }
)

# PLATFORM-ICE-ACCRETION
# WA1
wa1 <- list(
  ids = "WA1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 9),
      list(c(1,3),c(4,4),c(5,7),c(8,8),c(9,9)),
      c(
        'platform_ice_accretion',
        'source_code', 'thickness_dimension',
        'tendency_code', 'quality_code'
      )
    )
  }
)

# WATER-SURFACE-ICE-OBSERVATION
# WD1
wd1 <- list(
  ids = "WD1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 23),
      list(c(1,3),c(4,5),c(6,8),c(9,10),c(11,11),c(12,12),c(13,13),
           c(14,15),c(16,16),c(17,19),c(20,22),c(23,23)),
      c(
        'water_surface_ice',
        'edge_bearing_code', 'uniform_concentration_rate',
        'non_uniform_concentration_rate', 'ship_relative_position_code',
        'ship_penetrability_code', 'ice_trend_code', 'development_code',
        'growler_bergy_bit_presence_code',
        'growler_bergy_bit_quantity', 'iceberg_quantity',
        'quality_code'
      )
    )
  }
)

# WATER-SURFACE-ICE-HISTORICAL-OBSERVATION
# WG1
wg1 <- list(
  ids = "WG1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 14),
      list(c(1,3),c(4,5),c(6,7),c(8,9),c(10,11),c(12,13),c(14,14)),
      c(
        'water_surface_ice_historical',
        'edge_bearing_code', 'edge_distance_dimension',
        'edge_orientation_code', 'formation_type_code',
        'navigation_effect_code', 'quality_code'
      )
    )
  }
)

# WATER-LEVEL-OBSERVATION
# WJ1
wj1 <- list(
  ids = "WJ1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 22),
      list(c(1,3),c(4,6),c(7,11),c(12,13),c(14,15),c(16,20),
           c(21,21),c(22,22)),
      c(
        'water_level_observation',
        'ice_thickness', 'discharge_rate',
        'primary_ice_phenomena', 'secondary_ice_phenomena',
        'stage_height', 'under_ice_slush_condition',
        'water_level_code'
      )
    )
  }
)


