#' Parse NOAA ISD Files
#'
#' @section Data format:
#' Each record (data.frame row or individual list element) you get via
#' \code{isd_parse} or \code{isd_parse_line} has all data combined.
#' Control data fields are first, then mandatory fields, then additional data
#' fields and remarks. Control and mandatory fields have column names
#' describing what they are, while additional data fields have a length
#' three character prefix (e.g., AA1) linking the fields to the documentation
#' for the \strong{Additional Data Section} at
#' ftp://ftp.ncdc.noaa.gov/pub/data/noaa/ish-format-document.pdf
#'
#' @section Data size:
#' Each line of an ISD data file has maximum of 2,844 characters.
#'
#' @section Control Data:
#' The beginning of each record provides information about the report
#' including date, time, and station location information. Data fields
#' will be in positions identified in the applicable data definition.
#' The control data section is fixed length and is 60 characters long.
#'
#' @section Mandatory data:
#' Each line of an ISD data file starts with mandatory data section.
#' The mandatory data section contains meteorological information on the
#' basic elements such as winds, visibility, and temperature. These are the
#' most commonly reported parameters and are available most of the time.
#' The mandatory data section is fixed length and is 45 characters long.
#'
#' @section Additional data:
#' Each line of an ISD data file has an optional additional data
#' section, which follows the mandatory data section. These additional data
#' contain information of significance and/or which are received with
#' varying degrees of frequency. Identifiers are used to note when data
#' are present in the record. If all data fields in a group are missing,
#' the entire group is usually not reported. If no groups are reported
#' the section will be omitted. The additional data section is variable
#' in length with a minimum of 0 characters and a maximum of 637
#' (634 characters plus a 3 character section identifier) characters.
#'
#' @section Remarks data:
#' The numeric and character (plain language) remarks are provided if they
#' exist. The data will vary in length and are identified in the applicable
#' data definition. The remarks section has a maximum length of 515
#' (512 characters plus a 3 character section identifier) characters.
#'
#' @section Missing values:
#' Missing values for any non-signed item are filled (i.e., 999). Missing
#' values for any signed item are positive filled (i.e., +99999).
#'
#' @section Longitude and Latitude Coordinates:
#' Longitudes will be reported with negative values representing longitudes
#' west of 0 degrees, and latitudes will be negative south of the equator.
#' Although the data field allows for values to a thousandth of a degree,
#' the values are often only computed to the hundredth of a degree with
#' a 0 entered in the thousandth position.
#'
#' @name isdparser-package
#' @aliases isdparser
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL

#' NOAA ISD metadata data.frame
#'
#' This data.frame includes metadata describing all the data provided in ISD
#' data files. And is used for transforming and scaling variables.
#' 
#' Original csv data is in inst/extdata/isd_metadata.csv, collected from 
#' 
#'
#' The data.frame has the following columns:
#'
#' \itemize{
#'  \item pos - (chr) position, if any
#'  \item category - (chr) category, one of additional-data section,
#'  control-data section, element quality data section, mandatory-data section,
#'  original observation data section, or remarks data section
#'  \item sub_category - (chr) sub category label, one of climate reference
#'  network unique data, cloud and solar data, ground surface data, hail data,
#'  marine data, network metadata, precipitation-data, pressure data,
#'  runway visual range data, sea surface temperature, soil temperature data,
#'  temperature data, weather occurrence data, weather-occurrence-data,
#'  or wind data
#'  \item abbrev - (chr) abbreviation, if any, NA for control and mandatory
#'  sections
#'  \item label - (chr) label, a top level label for the data, usually the
#'  same as the abbreviation
#'  \item sub_label - (chr) sub label, a more detailed label about the
#'  variable
#'  \item field_length - (int) field length, number of characters
#'  \item min - (chr) minimum value, if applicable, original
#'  \item min_numeric - (int) minimum value, if applicable, integer
#'  \item max - (chr) maximum value, if applicable, original
#'  \item max_numeric - (chr) maximum value, if applicable, integer
#'  \item units - (chr) units, if applicable
#'  \item scaling_factor - (chr) scaling factor, original
#'  \item scaling_factor_numeric - (int) scaling factor, integer, one of
#'  1, 10, 100, 1000, or NA
#'  \item missing - (chr) value used to indicate missing data, original
#'  \item missing_numeric - (int) value used to indicate missing data, integer,
#'  one of 9, 99, 999, 9999, 99999, 999999, or NA
#'  \item description - (chr) short description of variable
#'  \item dom - (chr) long description of variable with categories
#'  \item dom_parsed_json - (list) NA if no categries, or a named list with
#'  category labels and their values
#' }
#'
#' @docType data
#' @keywords datasets
#' @format A data frame with 643 rows and 19 columns
#' @name isd_metadata
NULL
