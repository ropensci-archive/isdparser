# Temperature Data --------------------------------

# extreme air temperature
# KA1-KA4
ka <- function(x, code){
  str_pieces(
    str_match_len(x, code, 13),
    list(c(1,3),c(4,6),c(7,7),c(8,12),c(13,13)),
    c('extreme_temp','period_quantity','max_min','temp','temp_quality')
  )
}
