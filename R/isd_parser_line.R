#' Parse NOAA ISD/ISH data files - line by line
#'
#' @export
#' @param x (character) a single ISD line
#' @param additional (logical) include additional and remarks data sections
#' in output. Default: \code{TRUE}
#' @param as_data_frame (logical) output a tibble. Default: \code{FALSE}
#' @references ftp://ftp.ncdc.noaa.gov/pub/data/noaa
#' @return A tibble (data.frame)
#' @seealso \code{\link{isd_parse}}
#' @examples
#' path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
#' lns <- readLines(path, encoding = "latin1")
#' isd_parse_line(lns[1])
#' isd_parse_line(lns[1], FALSE)
#'
#' res <- lapply(lns[1:1000], isd_parse_line)
#' library("data.table")
#' library("tibble")
#' as_data_frame(
#'  rbindlist(res, use.names = TRUE, fill = TRUE)
#' )
#'
#' # only control + mandatory sections
#' isd_parse_line(lns[10], additional = FALSE)
#' isd_parse_line(lns[10], additional = TRUE)
isd_parse_line <- function(x, additional = TRUE, as_data_frame = TRUE) {
  if (!inherits(x, "character")) stop("'x' must be class character",
                                      call. = FALSE)
  res <- each_line(x, additional = additional)
  if (as_data_frame) tibble::as_data_frame(res) else res
}
