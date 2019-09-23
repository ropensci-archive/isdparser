#' Parse NOAA ISD/ISH data files
#'
#' @export
#' @param path (character) file path. required
#' @param additional (logical) include additional and remarks data sections
#' in output. Default: \code{TRUE}
#' @param parallel (logical). do processing in parallel. Default: \code{FALSE}
#' @param cores (integer) number of cores to use: Default: 2. We look in
#' your option "cl.cores", but use default value if not found.
#' @param progress (logical) print progress - ignored if \code{parallel=TRUE}.
#' The default is \code{FALSE} because printing progress adds a small bit of
#' time, so if processing time is important, then keep as \code{FALSE}
#' @references ftp://ftp.ncdc.noaa.gov/pub/data/noaa
#' @return A tibble (data.frame)
#' @seealso \code{\link{isd_parse_line}}
#' @examples
#' path <- system.file('extdata/104270-99999-1928.gz', package = "isdparser")
#'
#' (res <- isd_parse(path))
#'
#' # with progress
#' (res2 <- isd_parse(path, progress = TRUE))
#'
#' # only control + mandatory sections
#' (res <- isd_parse(path, additional = FALSE))
#'
#' @examples \dontrun{
#' # in parallel
#' (out <- isd_parse(path, parallel = TRUE))
#' }
isd_parse <- function(path, additional = TRUE, parallel = FALSE,
                      cores = getOption("cl.cores", 2), progress = FALSE) {

  if (!file.exists(path)) stop("file not found", call. = FALSE)
  message(sprintf("<path>%s", path), "\n")

  lns <- readLines(path, encoding = "latin1")
  if (parallel) {
    cl <- parallel::makeCluster(cores)
    linesproc <- parallel::parLapply(cl, lns, each_line,
                                     additional = additional)
    parallel::stopCluster(cl)
  } else {
    linesproc <- vector(mode = "list", length = length(lns))
    if (progress) {
      pb <- utils::txtProgressBar(min = 0, max = length(lns),
                                  initial = 0, style = 3)
      on.exit(close(pb))
    }
    for (i in seq_along(lns)) {
      if (progress) utils::setTxtProgressBar(pb, i)
      linesproc[[i]] <- each_line(lns[i],
                                  additional = additional)
    }
  }
  df <- data.table::setDF(
    data.table::rbindlist(linesproc, fill = TRUE, use.names = TRUE)
  )
  tibble::as_tibble(df)
}
