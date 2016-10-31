# sea surface temperature data
# sa1(x)
sa1 <- function(x, code) {
  str_pieces(
    str_match_len(x, code, 8),
    list(c(1,3),c(4,7),c(8,8)),
    c('sea_surface','temp','quality')
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

# element data quality section
# eqd(x)
eqd <- function(x, code) {
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
