# Remarks Data --------------------------------

# GEOPHYSICAL-POINT-OBSERVATION
# REM
nms_rem = c('remarks','identifier','length_quantity','comment')
rem <- list(
	ids = "REM",
	fun = function(x, code) {
	  str_pieces(
	    str_match_len(x, code, nchar(x)),
	    list(c(1,3),c(4,6),c(7,9),c(10,999)),
	    nms_rem
	  )
	}
)
