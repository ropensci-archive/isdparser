each_line <- function(y, additional) {
  oth <- NULL
  normal <- Map(function(a,b) subs(y, a, b),
                pluck(control_mand_secs, "start"),
                pluck(control_mand_secs, "stop"))
  if (additional) {
    other <- gsub("\\s+$", "", substring(y, 106, nchar(y)))
    oth <- proc_other(other)
  }
  if (is.null(oth)) {
    normal
  } else {
    c(normal, oth)
  }
}
