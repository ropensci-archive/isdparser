#' Parse NOAA ISD/ISH csv data files
#'
#' @export
#' @param path (character) file path. required
#' @references https://www.ncei.noaa.gov/data/global-hourly/access/
#' https://www.ncei.noaa.gov/data/global-hourly/doc/CSV_HELP.pdf
#' https://www.ncei.noaa.gov/data/global-hourly/doc/isd-format-document.pdf
#' @return A tibble (data.frame)
#' @details Note that the `rem` (remarks) and `eqd` columns are
#' not parsed, just as with [isd_parse()].
#' @section Column information:
#' 
#' - USAF MASTER and NCEI WBAN station identifiers are combined into an 11
#' character code with the column `station`
#' - Date and Time have been combined to the column `date`
#' - Call letter is synonymous with `call_sign` column
#' - WIND-OBSERVATION is abbreviated as column `wnd`
#' - SKY-CONDITION-OBSERVATION is abbreviated as column `cig`
#' - VISIBILITY-OBSERVATION is abbreviated as column `vis`
#' - AIR-TEMPERATURE-OBSERVATION air temperature is abbreviated as the column
#' header `tmp`
#' - AIR-TEMPERATURE-OBSERVATION dew point is abbreviated as the column
#' `dew`
#' - AIR-PRESSURE-OBSERVATION sea level pressure is abbreviated as the column
#' `slp`
#' 
#' @examples
#' path <- system.file('extdata/00702699999.csv', package = "isdparser")
#' (res <- isd_parse_csv(path))
#' 
#' # isd_parse_csv compared to isd_parse
#' if (interactive()) {
#' x="https://www.ncei.noaa.gov/data/global-hourly/access/2017/00702699999.csv"
#' download.file(x, (f_csv=file.path(tempdir(), "00702699999.csv")))
#' y="ftp://ftp.ncdc.noaa.gov/pub/data/noaa/2017/007026-99999-2017.gz"
#' download.file(y, (f_gz=file.path(tempdir(), "007026-99999-2017.gz")))
#' from_csv <- isd_parse_csv(f_csv)
#' from_gz <- isd_parse(f_gz, parallel = TRUE)
#' 
#' x="https://www.ncei.noaa.gov/data/global-hourly/access/1913/02982099999.csv"
#' download.file(x, (f=file.path(tempdir(), "02982099999.csv")))
#' isd_parse_csv(f)
#' 
#' x="https://www.ncei.noaa.gov/data/global-hourly/access/1923/02970099999.csv"
#' download.file(x, (f=file.path(tempdir(), "02970099999.csv")))
#' isd_parse_csv(f)
#' 
#' x="https://www.ncei.noaa.gov/data/global-hourly/access/1945/04390099999.csv"
#' download.file(x, (f=file.path(tempdir(), "04390099999.csv")))
#' isd_parse_csv(f)
#' 
#' x="https://www.ncei.noaa.gov/data/global-hourly/access/1976/02836099999.csv"
#' download.file(x, (f=file.path(tempdir(), "02836099999.csv")))
#' isd_parse_csv(f)
#' }
isd_parse_csv <- function(path) {
  assert(path, "character")
  if (!file.exists(path)) stop("file not found", call. = FALSE)
  message(sprintf("<path>%s", path), "\n")

  df <- data.table::fread(path, sep = ",", quote = "\"")
  if (NROW(df) == 0) {
    warning("file contents empty/no tabular data")
    return(tibble::tibble())
  }
  names(df) <- tolower(names(df))
  
  # date/time
  df$date <- lubridate::ymd_hms(df$date)
  
  # parse mandatory columns
  df[, csv_mandatory_cols$wnd := tstrsplit(wnd, ",", fixed = TRUE)]
  df[, csv_mandatory_cols$cig := tstrsplit(cig, ",", fixed = TRUE)]
  df[, csv_mandatory_cols$vis := tstrsplit(vis, ",", fixed = TRUE)]
  df[, csv_mandatory_cols$tmp := tstrsplit(tmp, ",", fixed = TRUE)]
  df[, csv_mandatory_cols$dew := tstrsplit(dew, ",", fixed = TRUE)]
  df[, csv_mandatory_cols$slp := tstrsplit(slp, ",", fixed = TRUE)]
  
  # parse additional columns
  some_patterns <- all_patterns[grep("eqd|rem", names(all_patterns), invert = TRUE)]
  cols_to_drop <- c()
  for (i in seq_along(df)) {
    mtch <- grep(names(df)[i], tolower(some_patterns))
    if (length(mtch) > 0) {
      cols_to_drop <- c(cols_to_drop, names(df)[i])
      cols <- paste0("nms_", names(some_patterns)[mtch])
      df[, get(cols)[-1] := tstrsplit(get(names(df)[i]), ",", fixed = TRUE)]
    }
  }
  # drop columns
  df[, eval(cols_to_drop):=NULL]
  
  # move rem and egd to the end
  tor <- c("rem", "eqd")
  setcolorder(df, c(colnames(df)[!colnames(df) %in% tor], tor))

  df <- tibble::as_tibble(df)
  return(df)
}

e_p <- function(x) parse(text = x)

csv_mandatory_cols <- list(
  wnd = c("wind_direction", "wind_direction_quality",
    "wind_code", "wind_speed", "wind_speed_quality"),
  cig = c("ceiling_height", "ceiling_height_quality",
    "ceiling_height_determination", "ceiling_height_cavok"),
  vis = c("visibility_distance", "visibility_distance_quality",
    "visibility_code", "visibility_code_quality"),
  tmp = c("temperature", "temperature_quality"),
  dew = c("temperature_dewpoint", "temperature_dewpoint_quality"),
  slp = c("air_pressure", "air_pressure_quality")
)
