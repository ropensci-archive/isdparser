#' Transform ISD data variables
#'
#' @export
#' @param x (data.frame/tbl_df) data.frame/tbl from \code{\link{isd_parse}} or
#' data.frame/tbl or list from \code{\link{isd_parse_line}}
#' @return A tibble (data.frame) or list
#' @seealso \code{\link{isd_parse}}, \code{\link{isd_parse_line}}
#'
#' @details This function helps you clean your ISD data. \code{\link{isd_parse}}
#' and \code{\link{isd_parse_line}} give back data without modifying the
#' data. However, you'll likely want to transform some of the variables,
#' in terms of the variable class (character to numeric), accounting for the
#' scaling factor (variable X may need to be multiplied by 1000 according
#' to the ISD docs), and missing values (unfortunately, missing value
#' standards vary across ISD data).
#'
#' @section operations performed:
#' \itemize{
#'  \item scale latitude by factor of 1000
#'  \item scale longitude by factor of 1000
#'  \item scale elevation by factor of 10
#'  \item scale wind speed by factor of 10
#'  \item scale temperature by factor of 10
#'  \item scale temperature dewpoint by factor of 10
#'  \item scale air pressure by factor of 10
#'  \item scale precipitation by factor of 10
#'  \item convert date to a Date class with \code{\link{as.Date}}
#'  \item change wind direction to numeric
#'  \item change total characters to numeric
#' }
#'
#' @examples
#' path <- system.file('extdata/104270-99999-1928.gz', package = "isdparser")
#' (res <- isd_parse(path))
#' isd_transform(res)
#'
#' lns <- readLines(path, encoding = "latin1")
#' # data.frame
#' (res <- isd_parse_line(lns[1]))
#' isd_transform(res)
#' # list
#' (res <- isd_parse_line(lns[1], as_data_frame = FALSE))
#' isd_transform(res)
isd_transform <- function(x) {
  UseMethod("isd_transform")
}

#' @export
isd_transform.default <- function(x) {
  stop("no 'isd_transform' method for ", class(x), call. = FALSE)
}

#' @export
isd_transform.data.frame <- function(x) trans_vars(x)

#' @export
isd_transform.list <- function(x) trans_vars(x)
