# Precipitation Data --------------------------------

# LIQUID-PRECIPITATION
# AA1-AA4
aa <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 11),
    list(c(1,3),c(4,5),c(6,9),c(10,10),c(11,11)),
    c('precipitation_liquid','period_quantity_hrs','depth',
      'condition_quality','quality_code')
  )
}

# LIQUID-PRECIPITATION MONTHLY TOTAL
# AB1
ab1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 10),
    list(c(1,3),c(4,8),c(9,9),c(10,10)),
    c('precipitation_liquid_monthly_total',
      'depth_dimension', 'condition_code',
      'quality_code')
  )
}

# PRECIPITATION-OBSERVATION-HISTORY
# AC1
ac1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 6),
    list(c(1,3),c(4,4),c(5,5),c(6,6)),
    c('precipitation_observation_history',
      'duration_code', 'characteristic_code',
      'quality_code')
  )
}

# LIQUID-PRECIPITATION GREATEST AMOUNT IN 24 HOURS, FOR THE MONTH
# AD1
ad1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 22),
    list(c(1,3),c(4,8),c(9,9),c(10,13),c(14,17),c(18,21),c(22,22)),
    c('precipitation_liquid_greatest_24_hrs',
      'depth_dimension', 'condition_code', 'dates_occurrence_1',
      'dates_occurrence_2', 'dates_occurrence_3',
      'quality_code')
  )
}

# LIQUID-PRECIPITATION, NUMBER OF DAYS WITH SPECIFIC AMOUNTS, FOR THE MONTH
# AE1
ae1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 15),
    list(c(1,3),c(4,8),c(9,9),c(10,13),c(14,17),c(18,21),c(22,22)),
    c(
      'precipitation_liquid_number_days_amt',
      'number_days_.01inch', 'quality_code_.01inch',
      'number_days_.10inch', 'quality_code_.10inch',
      'number_days_.50inch', 'quality_code_.50inch',
      'number_days_1inch', 'quality_code_1inch'
    )
  )
}

# PRECIPITATION-ESTIMATED-OBSERVATION identifier
# ag1(x)
ag1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 7),
    list(c(1,3),c(4,4),c(5,7)),
    c('precipitation_estimated','discrepancy_code','estimated_water_depth')
  )
}

# LIQUID-PRECIPITATION MAXIMUM SHORT DURATION, FOR THE MONTH
# AH1-AH6
ah <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 19),
    list(c(1,3),c(4,7),c(8,11),c(12,12),c(13,18),c(19,19)),
    c('precipitation_liquid_max_short_duration',
      'period_quantity','depth_dimension',
      'condition_code','ending_date_time', 'quality_code')
  )
}

# LIQUID-PRECIPITATION MAXIMUM SHORT DURATION, FOR THE MONTH
# AI1-AI6
# Note: This data group is identical to the AH1-6 group, for
# the purpose of allowing up to 12 occurrences of these reports.
ai <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 19),
    list(c(1,3),c(4,7),c(8,11),c(12,12),c(13,18),c(19,19)),
    c('precipitation_liquid_max_short_duration',
      'period_quantity','depth_dimension',
      'condition_code','ending_date_time', 'quality_code')
  )
}

# snow depth data
# aj1(x)
aj1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 17),
    list(c(1,3),c(4,7),c(8,8),c(9,9),c(10,15),c(16,16),c(17,17)),
    c('snow_depth','depth_dimension','condition_code',
      'quality_code','equivalent_water_depth',
      'equivalent_water_condition_code',
      'equivalent_water_condition_quality_code')
  )
}

# SNOW-DEPTH GREATEST DEPTH ON THE GROUND, FOR THE MONTH
# AK1
ak1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 15),
    list(c(1,3),c(4,7),c(8,8),c(9,14),c(15,15)),
    c('snow_depth_greatest','depth_dimension','condition_code',
      'date_occurrence', 'quality_code')
  )
}

# SNOW-ACCUMULATION
# AL1-AL4
al <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 10),
    list(c(1,3),c(4,5),c(6,8),c(9,9),c(10,10)),
    c('snow_accumulation','period_quantity','depth_dimension',
      'condition_code', 'quality_code')
  )
}

# SNOW-ACCUMULATION GREATEST AMOUNT IN 24 HOURS, FOR THE MONTH
# AM1
am1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 21),
    list(c(1,3),c(4,7),c(8,8),c(9,12),c(13,16),c(17,20),c(21,21)),
    c('snow_accumulation_greatest_24_hrs',
      'depth_dimension', 'condition_code',
      'dates_occurrence_1', 'dates_occurrence_2',
      'dates_occurrence_3', 'quality_code')
  )
}

# SNOW-ACCUMULATION FOR THE DAY/MONTH
# AN1
an1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 12),
    list(c(1,3),c(4,6),c(7,10),c(11,11),c(12,12)),
    c('snow_accumulation_day_month',
      'period_quantity', 'depth_dimension',
      'condition_code', 'quality_code')
  )
}

# LIQUID-PRECIPITATION
# AO1-AO4
ao <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 11),
    list(c(1,3),c(4,5),c(6,9),c(10,10),c(11,11)),
    c('precipitation_liquid',
      'period_quantity_minutes', 'depth_dimension',
      'condition_code', 'quality_code')
  )
}

# 15 Minute LIQUID-PRECIPITATION occurrence
# AP1-AP4
ap <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 9),
    list(c(1,3),c(4,7),c(8,8),c(9,9)),
    c('precipitation_liquid_15min',
      'gauge_value', 'condition_code', 'quality_code')
  )
}
