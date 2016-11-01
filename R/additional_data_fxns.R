isd_patterns <- c(
  'aa','ab1','ac1','ad1','ae1','ag1','ah','ai','aj1','ak1','al','am1',
  'an1','ao','ap','au','aw','ax','ay','az','cb','cf','cg','ch','ci1',
  'cn1','cn2','cn3','cn4','co','co1','cr','ct','cu','cv','cw','cx',
  'ed1','eqd','eqd_n','ga','gd','ge1','gf1','gg','gh1','gj1','gk1',
  'gl1','gm1','gn1','go1','gp1','gq1','gr1','hl1','ia1','ia2','ib1',
  'ib2','ic1','ka','kb','kc','kd','ke1','kf1','kg','ma1','md1','me1',
  'mf1','mg1','mh1','mk1','mv','mw','oa','ob','oc1','od1','oe','qnn',
  'rem','rh','sa1','st1','ua1','ug1','ug2','wa1','wd1','wg1','wj1'
)

proc_other <- function(x) {
  # grepl all patterns
  found_patterns <- as.list(
    all_patterns[vapply(all_patterns, grepl, logical(1), x = x)]
  )

  # extract just those that are found
  tt <- unname(Map(function(z, a) {
    obj <- eval(parse(text = a))
    check_get(x, z, obj$fun)
  }, found_patterns, names(found_patterns)))
  unlist(lapply(tt, function(z) {
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
  tmp <- lapply(pieces, function(x) {
    substring(z, x[1], if (x[2] == 999) nchar(z) else x[2])
  })
  if (is.null(nms)) tmp else stats::setNames(tmp, nms)
}
