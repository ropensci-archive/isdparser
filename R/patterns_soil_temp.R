# Soil Temperature Data --------------------------------

# SOIL-TEMPERATURE
# ST1
nms_st1 = c(
        'soil_temperature', 'temperature_type',
        'temperature', 'temperature_quality', 'temperature_depth',
        'temperature_depth_quality', 'soil_cover', 'soil_cover_quality',
        'sub_plot', 'sub_plot_quality'
      )
st1 <- list(
  ids = "ST1",
  fun = function(x, code){
    str_pieces(
      str_match_len(x, code, 20),
      list(c(1,3),c(4,4),c(5,9),c(10,10),c(11,14),c(15,15),c(16,17),
           c(18,18),c(19,19),c(20,20)),
      nms_st1
    )
  }
)
