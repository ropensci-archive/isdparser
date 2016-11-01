# Original Observation Data --------------------------------

# ORIGINAL-OBSERVATION-NCDC SURFACE HOURLY
# The following may be occur from 0 to 99 times
# QNN
qnn <- list(
	ids = c(paste0("QNN0", 1:9), paste0("QNN", 10:99)),
	fun = function(x, code) {
	  str_pieces(
	    str_match_len(x, code, 14),
	    list(c(1,3),c(4,8),c(9,14)),
	    c(
	      'original_observation',
	      'source_codes_and_flags',
	      'data_value'
	    )
	  )
	}
)
