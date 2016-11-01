all_patterns <- NULL

.onLoad <- function(libname, pkgname){
  all_patterns <<- lapply(isd_patterns, function(z) eval(parse(text = z))$ids)
  all_patterns <<- stats::setNames(
    unlist(all_patterns), rep(isd_patterns, vapply(all_patterns, length, 1))
  )
}
