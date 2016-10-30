pluck <- function(input, x) vapply(input, "[[", numeric(1), x)

subs <- function(z, start, stop) substring(z, start, stop)
