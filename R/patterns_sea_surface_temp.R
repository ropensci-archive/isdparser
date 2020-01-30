# Sea Surface Temperature Data ---------------------------

# SEA-SURFACE-TEMPERATURE-OBSERVATION
# sa1(x)
nms_sa1 = c('sea_surface','temp','quality')
sa1 <- list(
	ids = "SA1",
	fun = function(x, code) {
	  str_pieces(
	    str_match_len(x, code, 8),
	    list(c(1,3),c(4,7),c(8,8)),
	    nms_sa1
	  )
	}
)
