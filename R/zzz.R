pluck <- function(input, x) vapply(input, "[[", numeric(1), x)

subs <- function(z, start, stop) substring(z, start, stop)

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
          paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
