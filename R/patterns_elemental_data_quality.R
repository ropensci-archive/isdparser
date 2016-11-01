# Element Data Quality --------------------------------

# GEOPHYSICAL-POINT-OBSERVATION
# EQD
eqd <- list(
  ids = "EQD",
  fun = function(x, code) {
    eqdtmp <- str_match_len(x, code, nchar(x))
    eqdmtchs <- gregexpr("Q[0-9]{2}", eqdtmp)
    segments <- str_from_to(eqdtmp, eqdmtchs[[1]], 13)
    lapply(segments, function(m){
      str_pieces(
        m,
        list(c(1,3),c(4,9),c(10,10),c(11,16)),
        c('observation_identifier','observation_text',
          'reason_code','parameter')
      )
    })
  }
)

# ORIGINAL-OBSERVATION-ELEMENT-QUALITY
# The following may be occur from 0 to 99 times
# NO1-N99
eqd_n <- list(
  ids = c(paste0("N0", 1:9), paste0("N", 10:99)),
  fun = function(x, code) {
    str_pieces(
      str_match_len(x, code, 16),
      list(c(1,3),c(4,9),c(10,10),c(11,16)),
      c('original_observation', 'original_value_text',
        'units_code', 'parameter_code')
    )
  }
)
