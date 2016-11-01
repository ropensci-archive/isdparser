# Runway Visual Range Data --------------------------------

# RUNWAY-VISUAL-RANGE-OBSERVATION
# ED1
ed1 <- list(
	ids = "ED1",
	fun = function(x, code){
	  str_pieces(
	    str_match_len(x, code, 11),
	    list(c(1,3),c(4,5),c(6,6),c(7,10),c(11,11)),
	    c('runway_visual_range', 'direction_angle',
	      'runway_designator_code', 'visibility_dimension',
	      'quality_code')
	  )
	}
)
