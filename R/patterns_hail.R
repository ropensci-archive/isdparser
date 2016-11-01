# Hail Data --------------------------------

# HAIL
# HL1
hl1 <- list(
	ids = "HL1",
	fun = function(x, code){
	  str_pieces(
	    str_match_len(x, code, 7),
	    list(c(1,3),c(4,6),c(7,7)),
	    c('hail', 'size_diameter_largest', 'size_diameter_largest_quality')
	  )
	}
)
