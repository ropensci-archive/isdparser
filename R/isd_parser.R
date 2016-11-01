#' Parse NOAA ISD/ISH data files
#'
#' @export
#' @param path (character) file path. required
#' @param parallel (logical). do processing in parallel. Default: \code{FALSE}
#' @param cores (integer) number of cores to use: Default: 2. We look in
#' your option "cl.cores", but use default value if not found.
#' @references ftp://ftp.ncdc.noaa.gov/pub/data/noaa
#' @return A tibble (data.frame)
#' @examples \dontrun{
#' path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
#'
#' (res <- isd_parse(path))
#'
#' # in parallel
#' (out <- isd_parse(path, parallel = TRUE))
#'
#' identical(res, out)
#'
#' download.file()
#' }
isd_parse <- function(path, parallel = FALSE, cores = getOption("cl.cores", 2)) {
  if (!file.exists(path)) stop("file not found", call. = FALSE)
  message(sprintf("<path>%s", path), "\n")

  lns <- readLines(path, encoding = "latin1")
  if (parallel) {
    cl <- parallel::makeCluster(cores)
    linesproc <- parallel::parLapply(cl, lns, each_line, sections = sections)
    parallel::stopCluster(cl)
  } else {
    linesproc <- lapply(lns, each_line, sections = sections)
  }
  df <- data.table::setDF(
    data.table::rbindlist(linesproc, fill = TRUE, use.names = TRUE)
  )
  tibble::as_data_frame(trans_vars(df))
}
