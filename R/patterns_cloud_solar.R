# Cloud and Solar Data --------------------------------

# SKY-COVER-LAYER
# GA1-GA6
ga <- list(
  ids = paste0("GA", 1:6),
  fun = function(x, code){
    str_pieces(
      str_match_len(x, code, 16),
      list(c(1,3),c(4,5),c(6,6),c(7,12),c(13,13),c(14,15),c(16,16)),
      c('sky_cover_layer_identifier',
        'coverage_code', 'coverage_quality_code', 'base_height_dimension',
        'base_height_quality_code', 'cloud_type_code',
        'cloud_type_quality_code')
    )
  }
)

# SKY-COVER-SUMMATION-STATE
# GD1-GD6
gd <- list(
  ids = paste0("GD", 1:6),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 15),
      list(c(1,3),c(4,4),c(5,6),c(7,7),c(8,13),c(14,14),c(15,15)),
      c('sky_cover_summation_state_identifier',
        'coverage_code_1', 'coverage_code_2',
        'coverage_quality_code', 'height_dimension',
        'height_dimension_quality_code', 'characteristic_code')
    )
  }
)

# SKY-CONDITION-OBSERVATION
# GE1
ge1 <- list(
  ids = "GE1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 22),
      list(c(1,3),c(4,4),c(5,10),c(11,16),c(17,22)),
      c('sky_condition','connective_cloud_attribute',
        'vertical_datum_attribute',
        'base_height_upper_range_attribute',
        'base_height_lower_range_attribute')
    )
  }
)

# SKY-CONDITION-OBSERVATION
# GF1
gf1 <- list(
  ids = "GF1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 26),
      list(c(1,3),c(4,5),c(6,7),c(8,8),c(9,10),c(11,11),c(12,13),
           c(14,14),c(15,19),c(20,20),c(21,22),c(23,23),c(24,25),c(26,26)),
      c('sky_condition','coverage','opaque_coverage','coverage_quality',
        'lowest_cover','lowest_cover_quality',
        'low_cloud_genus','low_cloud_genus_quality',
        'lowest_cloud_base_height','lowest_cloud_base_height_quality',
        'mid_cloud_genus','mid_cloud_genus_quality','high_cloud_genus',
        'high_cloud_genus_quality')
    )
  }
)

# BELOW-STATION-CLOUD-LAYER
# GG1-GG6
gg <- list(
  ids = paste0("GG", 1:6),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 18),
      list(c(1,3),c(4,5),c(6,6),c(7,11),c(12,12),c(13,14),c(15,15),
           c(16,17),c(18,18)),
      c('below_station_cloud_layer', 'coverage_code', 'coverage_quality',
        'top_height_dimension','top_height_dimension_quality',
        'type_code','type_code_quality',
        'top_code','top_code_quality')
    )
  }
)

# Hourly Solar Radiation Section
# GH1
gh1 <- list(
  ids = "GH1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 31),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,15),c(16,16),c(17,17),
           c(18,22),c(23,23),c(24,24),c(25,29),c(30,30),c(31,31)),
      c('hourly_solar_radiation',
        'hourly_avg_solar_radiation',
        'hourly_avg_solar_radiation_quality',
        'hourly_avg_solar_radiation_flag',
        'hourly_min_solar_radiation',
        'hourly_min_solar_radiation_quality',
        'hourly_min_solar_radiation_flag',
        'hourly_max_solar_radiation',
        'hourly_max_solar_radiation_quality',
        'hourly_max_solar_radiation_flag',
        'hourly_stdev_solar_radiation',
        'hourly_stdev_solar_radiation_quality',
        'hourly_stdev_solar_radiation_flag'
      )
    )
  }
)

# SUNSHINE-OBSERVATION
# GJ1
gj1 <- list(
  ids = paste0("GJ", 1:6),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 8),
      list(c(1,3),c(4,7),c(8,8)),
      c('sunshine_observation', 'duration', 'duration_quality')
    )
  }
)

# SUNSHINE-OBSERVATION
# GK1
gk1 <- list(
  ids = "GK1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 7),
      list(c(1,3),c(4,6),c(7,7)),
      c('percent_sunshine_possible', 'percent_sunshine_occurred',
        'percent_sunshine_occurred_quality')
    )
  }
)

# SUNSHINE-OBSERVATION FOR THE MONTH
# GL1
gl1 <- list(
  ids = "GL1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 9),
      list(c(1,3),c(4,8),c(9,9)),
      c('sunshine_month', 'quantity_sunshine',
        'quantity_sunshine_quality')
    )
  }
)

# Solar Irradiance Section
# GM1
gm1 <- list(
  ids = "GM1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 33),
      list(c(1,3),c(4,7),c(8,11),c(12,13),c(14,14),c(15,18),c(19,20),
           c(21,21),c(22,25),c(26,27),c(28,28),c(29,32),c(33,33)),
      c('solar_irradiance', 'time_period_min', 'global_irradiance',
        'global_irradiance_data_flag', 'global_irradiance_quality',
        'direct_beam_irradiance', 'direct_beam_irradiance_data_flag',
        'direct_beam_irradiance_quality', 'diffuse_irradiance',
        'diffuse_irradiance_data_flag', 'diffuse_irradiance_quality',
        'uvb_global_irradiance', 'uvb_global_irradiance_quality'
      )
    )
  }
)

# Solar Radiation Section
# GN1
gn1 <- list(
  ids = "GN1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 31),
      list(c(1,3),c(4,7),c(8,11),c(12,12),c(13,16),c(17,17),c(18,21),
           c(22,22),c(23,26),c(27,27),c(28,30),c(31,31)),
      c('solar_radition', 'time_period_min',
        'upwelling_global_radiation',
        'upwelling_global_radiation_quality',
        'downwelling_thermal_infrared_radiation',
        'downwelling_thermal_infrared_radiation_quality',
        'upwelling_thermal_infrared_radiation',
        'upwelling_thermal_infrared_radiation_quality',
        'photosynthetically_active_radiation',
        'photosynthetically_active_radiation_quality',
        'solar_zenith_angle',
        'solar_zenith_angle_quality'
      )
    )
  }
)

# Net Solar Radiation Section
# GO1
go1 <- list(
  ids = "GO1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 22),
      list(c(1,3),c(4,7),c(8,11),c(12,12),c(13,16),c(17,17),c(18,21),
           c(22,22)),
      c('net_solar_radition', 'time_period_min',
        'net_solar_radiation',
        'net_solar_radiation_quality',
        'net_infrared_radiation',
        'net_infrared_radiation_quality',
        'net_radiation',
        'net_radiation_quality'
      )
    )
  }
)

# Modeled Solar Irradiance Section
# GP1
gp1 <- list(
  ids = "GP1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 34),
      list(c(1,3),c(4,7),c(8,11),c(12,12),c(13,16),c(17,20),c(21,22),
           c(23,25),c(26,29),c(30,31),c(32,34)),
      c('modeled_solar_irradiance', 'time_period_min',
        'modeled_global_horizontal',
        'modeled_global_horizontal_source_flag',
        'modeled_global_horizontal_uncertainty',
        'modeled_direct_normal',
        'modeled_direct_normal_source_flag',
        'modeled_direct_normal_uncertainty',
        'modeled_diffuse_horizontal',
        'modeled_diffuse_horizontal_source_flag',
        'modeled_diffuse_horizontal_uncertainty'
      )
    )
  }
)

# Hourly Solar Angle Section
# GQ1
gq1 <- list(
  ids = "GQ1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 17),
      list(c(1,3),c(4,7),c(8,11),c(12,12),c(13,16),c(17,17)),
      c('hourly_solar_angle',
        'time_period_min',
        'hourly_mean_zenith_angle',
        'hourly_mean_zenith_angle_quality',
        'hourly_mean_azimuth_angle',
        'hourly_mean_azimuth_angle_quality'
      )
    )
  }
)

# Hourly Extraterrestrial Radiation Section
# GR1
gr1 <- list(
  ids = "GR1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 17),
      list(c(1,3),c(4,7),c(8,11),c(12,12),c(13,16),c(17,17)),
      c('hourly_extraterrestrial_radiation',
        'time_period_min',
        'extraterrestrial_radiation_horizontal',
        'extraterrestrial_radiation_horizontal_quality',
        'extraterrestrial_radiation_horizontal_normal',
        'extraterrestrial_radiation_horizontal_normal_quality'
      )
    )
  }
)
