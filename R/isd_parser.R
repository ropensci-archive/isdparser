#' Parse NOAA ISD/ISH data files
#'
#' @export
#' @param path (character) file path. required
#' @references ftp://ftp.ncdc.noaa.gov/pub/data/noaa
#' @return A tibble (data.frame)
#' @examples \dontrun{
#' isd_parser(path = "~/Downloads/725300-94846-2014.gz")
#' }
isd_parser <- function(path, ...) {
  if (!file.exists(path)) stop("file not found", call. = FALSE)
  message(sprintf("<path>%s", path), "\n")

  lns <- readLines(path, encoding = "latin1")
  linesproc <- lapply(lns, each_line, sections = sections)
  df <- data.table::setDF(
    data.table::rbindlist(linesproc, fill = TRUE, use.names = TRUE)
  )
  tibble::as_data_frame(trans_vars(df))
}

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
