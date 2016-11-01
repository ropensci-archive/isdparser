each_line <- function(y, sections){
  normal <- Map(function(a,b) subs(y, a, b),
                pluck(sections, "start"),
                pluck(sections, "stop"))
  other <- gsub("\\s+$", "", substring(y, 106, nchar(y)))
  oth <- proc_other(other)
  if (is.null(oth)) {
    normal
  } else {
    c(normal, oth)
  }
}
