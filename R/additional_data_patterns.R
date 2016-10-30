# sea surface temperature data
# sa1(x)
sa1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 8),
    list(c(1,3),c(4,7),c(8,8)),
    c('sea_surface','temp','quality')
  )
}

# precipitation data
# AA1-AA4
aa <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 11),
    list(c(1,3),c(4,5),c(6,9),c(10,10),c(11,11)),
    c('precipitation_liquid','period_quantity_hrs','depth',
      'condition_quality','quality_code')
  )
}

# snow depth data
# aj1(x)
aj1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 17),
    list(c(1,3),c(4,7),c(8,8),c(9,9),c(10,15),c(16,16),c(17,17)),
    c('snow_depth','depth','condition_code',
      'quality_code','equivalent_water_depth',
      'equivalent_water_condition_code',
      'equivalent_water_condition_quality_code')
  )
}

# sky condition
# ge1(x)
ge1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 22),
    list(c(1,3),c(4,4),c(5,10),c(11,16),c(17,22)),
    c('sky_condition','connective_cloud_attribute',
      'vertical_datum_attribute',
      'base_height_upper_range_attribute',
      'base_height_lower_range_attribute')
  )
}

# remarks section
# rem(x)
rem <- function(x, code) {
  str_pieces(
    str_match_len(x, code, nchar(x)),
    list(c(1,3),c(4,6),c(7,9),c(10,999)),
    c('remarks','identifier','length_quantity','comment')
  )
}

# past weather manual observation
# ay(x)
ay <- function(x, code){
  str_pieces(
    str_match_len(x, code, 8),
    list(c(1,3),c(4,4),c(5,5),c(6,7),c(8,8)),
    c('manual_occurrence','condition_code','condition_quality','period','period_quality')
  )
}

# PRECIPITATION-ESTIMATED-OBSERVATION identifier
# ag1(x)
ag1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 7),
    list(c(1,3),c(4,4),c(5,7)),
    c('precipitation','discrepancy','est_water_depth')
  )
}

# sky condition
# gf1(x)
gf1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 26),
    list(c(1,3),c(4,5),c(6,7),c(8,8),c(9,10),c(11,11),c(12,13),c(14,14),c(15,19),c(20,20),c(21,22),c(23,23),c(24,25),c(26,26)),
    c('sky_condition','coverage','opaque_coverage','coverage_quality','lowest_cover','lowest_cover_quality',
      'low_cloud_genus','low_cloud_genus_quality','lowest_cloud_base_height','lowest_cloud_base_height_quality',
      'mid_cloud_genus','mid_cloud_genus_quality','high_cloud_genus','high_cloud_genus_quality')
  )
}

# extreme air temperature
# KA1-KA4
ka <- function(x, code){
  str_pieces(
    str_match_len(x, code, 13),
    list(c(1,3),c(4,6),c(7,7),c(8,12),c(13,13)),
    c('extreme_temp','period_quantity','max_min','temp','temp_quality')
  )
}

# element data quality section
# eqd(x)
eqd <- function(x, code) {
  eqdtmp <- str_match_len(x, code, nchar(x))
  eqdmtchs <- gregexpr("Q[0-9]{2}", eqdtmp)
  segments <- str_from_to(eqdtmp, eqdmtchs[[1]], 13)
  lapply(segments, function(m){
    str_pieces(m,
               list(c(1,3),c(4,9),c(10,10),c(11,16)),
               c('observation_identifier','observation_text','reason_code','parameter')
    )
  })
}

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
    c('atmospheric_change','tendency','tendency_quality','three_hr','three_hr_quality',
      'twentyfour_hr','twentyfour_hr_quality')
  )
}

# PRESENT-WEATHER-OBSERVATION manual occurrence identifier, MW1=first weather reported
# mw1(x)
mw1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 6),
    list(c(1,3),c(4,5),c(6,6)),
    c('first_weather_reported','condition','condition_quality')
  )
}

# weather occurrence data
# AW1-AW4
aw <- function(x, code){
  str_pieces(
    str_match_len(x, code, 6),
    list(c(1,3),c(4,5),c(6,6)),
    c('present_weather_observation_identifier',
      'automated_atmospheric_condition_code',
      'quality_automated_atmospheric_condition_code')
  )
}

# weather occurrence data
# AU1-AU9
au <- function(x, code){
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

# Cloud and Solar Data: SKY-COVER-SUMMATION-STATE
# GD1-GD6
gd <- function(x, code){
  str_pieces(
    str_match_len(x, code, 15),
    list(c(1,3),c(4,4),c(5,6),c(7,7),c(8,13),c(14,14),c(15,15)),
    c('sky_cover_summation_state_identifier',
      'coverage_code_1', 'coverage_code_2',
      'coverage_quality_code', 'height_dimension',
      'height_dimension_quality_code', 'characteristic_code')
  )
}

# Cloud and Solar Data: SKY-COVER-LAYER
# GA1-GA6
ga <- function(x, code){
  str_pieces(
    str_match_len(x, code, 16),
    list(c(1,3),c(4,5),c(6,6),c(7,12),c(13,13),c(14,15),c(16,16)),
    c('sky_cover_layer_identifier',
      'coverage_code', 'coverage_quality_code', 'base_height_dimension',
      'base_height_quality_code', 'cloud_type_code',
      'cloud_type_quality_code')
  )
}

# Wind Data: WIND-GUST-OBSERVATION
# OC1
oc1 <- function(x, code){
  str_pieces(
    str_match_len(x, code, 8),
    list(c(1,3),c(4,7),c(8,8)),
    c('wind_gust_observation_identifier', 'speed_rate', 'quality_code')
  )
}

# Wind Data: SUPPLEMENTARY-WIND-OBSERVATION
# OD1-OD3
od1 <- function(x, code){
  str_pieces(
    str_match_len(x, code, 14),
    list(c(1,3),c(4,4),c(5,6),c(7,10),c(11,11),c(12,14)),
    c('supplementary_wind_observation_identifier',
      'type_code', 'period_quantity', 'speed_rate',
      'speed_rate_quality_code', 'direction_quantity')
  )
}

# Wind Data: SUMMARY-OF-DAY-WIND-OBSERVATION
# OE1-OE3
oe <- function(x, code){
  str_pieces(
    str_match_len(x, code, 19),
    list(c(1,3),c(4,4),c(5,6),c(7,11),c(12,14),c(15,18),c(19,19)),
    c('summary_of_day_wind_observation_identifier',
      'type_code', 'period_quantity', 'speed_rate',
      'direction_of_wind', 'time_of_occurrence_in_z_time_utc',
      'quality_code')
  )
}
