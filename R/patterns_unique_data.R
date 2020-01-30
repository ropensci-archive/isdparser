# Climate Reference Network Unique Data ----------------------------

# Subhourly Observed Liquid Precipitation Section: Secondary Sensor
# CB1-CB2
nms_cb = c('subhourly_liquid_precipitation_secondary_sensor',
        'period_quantity', 'liquid_depth',
        'quality_code', 'quality_flag')
cb <- list(
  ids = paste0("CB", 1:2),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 13),
      list(c(1,3),c(4,5),c(6,11),c(12,12),c(13,13)),
      nms_cb
    )
  }
)

# Hourly Fan Speed Section
# CF1-CF3
nms_cf = c('hourly_fan_speed', 'fan_speed',
        'quality_code', 'quality_flag')
cf <- list(
  ids = paste0("CF", 1:4),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 9),
      list(c(1,3),c(4,7),c(8,8),c(9,9)),
      nms_cf
    )
  }
)

# Subhourly Observed Liquid Precipitation Section: Primary Sensor
# CG1-CG3
nms_cg = c('subhourly_liquid_precipitation_primary_sensor',
        'liquid_depth', 'quality_code', 'quality_flag')
cg <- list(
  ids = paste0("CG", 1:4),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 11),
      list(c(1,3),c(4,9),c(10,10),c(11,11)),
      nms_cg
    )
  }
)

# Hourly/Sub-Hourly Relative Humidity/Temperature Section
# CH1-CH3
nms_ch = c('hourly_subhourly_relative_humidity_temperature',
        'period_quantity_minutes',
        'average_air_temperature',
        'average_air_temperature_quality_code',
        'average_air_temperature_quality_flag',
        'average_relative_humidity',
        'average_relative_humidity_quality_code',
        'average_relative_humidity_quality_flag')
ch <- list(
  ids = paste0("CH", 1:4),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 18),
      list(c(1,3),c(4,9),c(10,10),c(11,11)),
      nms_ch
    )
  }
)

# Hourly Relative Humidity/Temperature Section
# CI1
nms_ci1 = c(
        'hourly_relative_humidity_temperature',
        'minimum_air_temperature',
        'minimum_air_temperature_quality_code',
        'minimum_air_temperature_quality_flag',
        'maximum_air_temperature',
        'maximum_air_temperature_quality_code',
        'maximum_air_temperature_quality_flag',
        'standard_deviation_air_temperature',
        'standard_deviation_air_temperature_quality_code',
        'standard_deviation_air_temperature_quality_flag',
        'standard_deviation_relative_humidity',
        'standard_deviation_relative_humidity_quality_code',
        'standard_deviation_relative_humidity_quality_flag'
      )
ci1 <- list(
  ids = "CI1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 31),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,15),c(16,16),c(17,17),
           c(18,22),c(23,23),c(24,24),c(25,29),c(30,30),c(31,31)),
      nms_ci1
    )
  }
)

# Hourly Battery Voltage Section
# CN1
nms_cn1 = c(
        'hourly_battery_voltage',
        'average_voltage',
        'average_voltage_quality_code',
        'average_voltage_quality_flag',
        'average_voltage_full_load',
        'average_voltage_full_load_quality_code',
        'average_voltage_full_load_quality_flag',
        'average_voltage_datalogger',
        'average_voltage_datalogger_quality_code',
        'average_voltage_datalogger_quality_flag'
      )
cn1 <- list(
  ids = "CN1",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 21),
      list(c(1,3),c(4,7),c(8,8),c(9,9),c(10,13),c(14,14),c(15,15),
           c(16,19),c(20,20),c(21,21)),
      nms_cn1
    )
  }
)

# Hourly Diagnostic Section
# CN2
nms_cn2 = c(
        'hourly_diagnostic',
        'equipment_temperature',
        'equipment_temperature_quality_code',
        'equipment_temperature_quality_flag',
        'inlet_max_temperature',
        'inlet_max_temperature_quality_code',
        'inlet_max_temperature_quality_flag',
        'minutes_datalogger_open',
        'minutes_datalogger_open_quality_code',
        'minutes_datalogger_open_quality_flag'
      )
cn2 <- list(
  ids = "CN2",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 21),
      list(c(1,3),c(4,8),c(9,9),c(10,10),c(11,15),c(16,16),c(17,17),
           c(18,19),c(20,20),c(21,21)),
      nms_cn2
    )
  }
)

# Secondary Hourly Diagnostic Section
# CN3
nms_cn3 = c(
        'secondary_hourly_diagnostic',
        'reference_resistance_average',
        'reference_resistance_average_quality_code',
        'reference_resistance_average_quality_flag',
        'datalogger_signature',
        'datalogger_signature_quality_code',
        'datalogger_signature_quality_flag'
      )
cn3 <- list(
  ids = "CN3",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 19),
      list(c(1,3),c(4,9),c(10,10),c(11,11),c(12,17),c(18,18),c(19,19)),
      nms_cn3
    )
  }
)

# Secondary Hourly Diagnostic Section
# CN4
nms_cn4 = c(
        'secondary_hourly_diagnostic',
        'guage_heater_flag',
        'guage_heater_flag_quality_code',
        'guage_heater_flag_quality_flag',
        'datalogger_flag',
        'datalogger_flag_quality_code',
        'datalogger_flag_quality_flag',
        'forward_transmitter_wattage',
        'forward_transmitter_wattage_quality_code',
        'forward_transmitter_wattage_quality_flag',
        'reflected_transmitter_power',
        'reflected_transmitter_power_quality_code',
        'reflected_transmitter_power_quality_flag'
      )
cn4 <- list(
  ids = "CN4",
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 19),
      list(c(1,3),c(4,4),c(5,5),c(6,6),c(7,7),c(8,8),c(9,9),
           c(10,12),c(13,13),c(14,14),c(15,17),c(18,18),c(19,19)),
      nms_cn4
    )
  }
)
