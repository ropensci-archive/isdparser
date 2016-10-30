proc_other <- function(x){
  # x <- substring(x, 4, nchar(x))
  tt <- list(
    check_get(x, "AA1", aa),
    check_get(x, "AA2", aa),
    check_get(x, "AA3", aa),
    check_get(x, "AA4", aa),
    check_get(x, "SA1", sa1),
    check_get(x, "AJ1", aj1),
    check_get(x, "GE1", ge1),
    check_get(x, "REM", rem),
    check_get(x, "AY1", ay),
    check_get(x, "AY2", ay),
    check_get(x, "AG1", ag1),
    check_get(x, "GF1", gf1),
    check_get(x, "KA1", ka),
    check_get(x, "KA2", ka),
    check_get(x, "KA3", ka),
    check_get(x, "KA4", ka),
    check_get(x, "EQD", eqd),
    check_get(x, "MD1", md1),
    check_get(x, "MA1", ma1),
    check_get(x, "MW1", mw1),
    check_get(x, "AU1", au),
    check_get(x, "AU2", au),
    check_get(x, "AU3", au),
    check_get(x, "AU4", au),
    check_get(x, "AU5", au),
    check_get(x, "AU6", au),
    check_get(x, "AU7", au),
    check_get(x, "AU8", au),
    check_get(x, "AU9", au),
    check_get(x, "AW1", aw),
    check_get(x, "AW2", aw),
    check_get(x, "AW3", aw),
    check_get(x, "AW4", aw),
    check_get(x, "GA1", ga),
    check_get(x, "GA2", ga),
    check_get(x, "GA3", ga),
    check_get(x, "GA4", ga),
    check_get(x, "GA5", ga),
    check_get(x, "GA6", ga),
    check_get(x, "GD1", gd),
    check_get(x, "GD2", gd),
    check_get(x, "GD3", gd),
    check_get(x, "GD4", gd),
    check_get(x, "GD5", gd),
    check_get(x, "GD6", gd),
    check_get(x, "OC1", oc1),
    check_get(x, "OD1", od1),
    check_get(x, "OE1", oe),
    check_get(x, "OE2", oe),
    check_get(x, "OE3", oe)
  )
  other <- tt[!vapply(tt, function(x) is.null(x[[1]]), TRUE)]
  unlist(lapply(other, function(z) {
    nms <- names(z)
    tmp <- if (!is_named(z[[1]])) z[[1]][[1]] else z[[1]]
    stats::setNames(tmp, paste(nms, names(tmp), sep = "_"))
  }), FALSE)
}

is_named <- function(x) !is.null(names(x))

check_get <- function(string, pattern, fxn) {
  yy <- regexpr(pattern, string)
  tt <- if (yy > 0) fxn(string, pattern) else NULL
  stats::setNames(list(tt), pattern)
}

# str_match_len(x, "SA1", 8)
str_match_len <- function(x, index, length){
  ff <- regexpr(index, x)
  if (ff > 0) {
    substring(x, ff[1], ff[1] + (length - 1))
  } else {
    NULL
  }
}

str_from_to <- function(x, a, b){
  substring(x, a, a + b)
}

str_pieces <- function(z, pieces, nms=NULL){
  tmp <- lapply(pieces, function(x) substring(z, x[1], if (x[2] == 999) nchar(z) else x[2]))
  if (is.null(nms)) tmp else stats::setNames(tmp, nms)
}
