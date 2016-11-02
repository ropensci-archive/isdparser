isdparser
=========



[![Build Status](https://travis-ci.org/ropenscilabs/isdparser.svg?branch=master)](https://travis-ci.org/ropenscilabs/isdparser)
[![codecov.io](https://codecov.io/github/ropenscilabs/isdparser/coverage.svg?branch=master)](https://codecov.io/github/ropenscilabs/isdparser?branch=master)


`isdparser` is a parser for ISD/ISD NOAA files

Code liberated from `rnoaa` to focus on ISD parsing since it's sorta
complicated. Has minimal dependencies, so you can parse your ISD/ISH
files without needing the deps that `rnoaa` needs. Will be used by
`rnoaa` once on CRAN.

Documentation at ftp://ftp.ncdc.noaa.gov/pub/data/noaa/ish-format-document.pdf

## API:

* `isd_parse()` - parse all lines in a file, with parallel option
* `isd_parse_line()` - parse a single line - you choose which lines to parse
and how to apply the function to your lines

## Installation

CRAN stable version


```r
install.packages("isdparser")
```

Dev version


```r
devtools::install_github("ropenscilabs/isdparser")
```


```r
library('isdparser')
```

### Parse lines from an ISD file


```r
path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
lns <- readLines(path, encoding = "latin1")
isd_parse_line(lns[1])
#> # A tibble: 1 × 42
#>   total_chars usaf_station wban_station       date  time date_flag
#>         <dbl>        <chr>        <chr>     <date> <chr>     <chr>
#> 1          54       024130        99999 2016-01-01  0000         4
#> # ... with 36 more variables: latitude <dbl>, longitude <dbl>,
#> #   type_code <chr>, elevation <dbl>, call_letter <chr>, quality <chr>,
#> #   wind_direction <dbl>, wind_direction_quality <chr>, wind_code <chr>,
#> #   wind_speed <dbl>, wind_speed_quality <chr>, ceiling_height <chr>,
#> #   ceiling_height_quality <chr>, ceiling_height_determination <chr>,
#> #   ceiling_height_cavok <chr>, visibility_distance <chr>,
#> #   visibility_distance_quality <chr>, visibility_code <chr>,
#> #   visibility_code_quality <chr>, temperature <dbl>,
#> #   temperature_quality <chr>, temperature_dewpoint <dbl>,
#> #   temperature_dewpoint_quality <chr>, air_pressure <dbl>,
#> #   air_pressure_quality <chr>,
#> #   AW1_present_weather_observation_identifier <chr>,
#> #   AW1_automated_atmospheric_condition_code <chr>,
#> #   AW1_quality_automated_atmospheric_condition_code <chr>,
#> #   N03_original_observation <chr>, N03_original_value_text <chr>,
#> #   N03_units_code <chr>, N03_parameter_code <chr>, REM_remarks <chr>,
#> #   REM_identifier <chr>, REM_length_quantity <chr>, REM_comment <chr>
```

Or, give back a list


```r
head(
  isd_parse_line(lns[1], as_data_frame = FALSE)
)
#> $total_chars
#> [1] 54
#> 
#> $usaf_station
#> [1] "024130"
#> 
#> $wban_station
#> [1] "99999"
#> 
#> $date
#> [1] "2016-01-01"
#> 
#> $time
#> [1] "0000"
#> 
#> $date_flag
#> [1] "4"
```

### Parse an ISD file


```r
path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
isd_parse(path)
#> # A tibble: 2,601 × 42
#>    total_chars usaf_station wban_station       date  time date_flag
#>          <dbl>        <chr>        <chr>     <date> <chr>     <chr>
#> 1           54       024130        99999 2016-01-01  0000         4
#> 2           54       024130        99999 2016-01-01  0100         4
#> 3           54       024130        99999 2016-01-01  0200         4
#> 4           54       024130        99999 2016-01-01  0300         4
#> 5           54       024130        99999 2016-01-01  0400         4
#> 6           39       024130        99999 2016-01-01  0500         4
#> 7           54       024130        99999 2016-01-01  0600         4
#> 8           39       024130        99999 2016-01-01  0700         4
#> 9           54       024130        99999 2016-01-01  0800         4
#> 10          54       024130        99999 2016-01-01  0900         4
#> # ... with 2,591 more rows, and 36 more variables: latitude <dbl>,
#> #   longitude <dbl>, type_code <chr>, elevation <dbl>, call_letter <chr>,
#> #   quality <chr>, wind_direction <dbl>, wind_direction_quality <chr>,
#> #   wind_code <chr>, wind_speed <dbl>, wind_speed_quality <chr>,
#> #   ceiling_height <chr>, ceiling_height_quality <chr>,
#> #   ceiling_height_determination <chr>, ceiling_height_cavok <chr>,
#> #   visibility_distance <chr>, visibility_distance_quality <chr>,
#> #   visibility_code <chr>, visibility_code_quality <chr>,
#> #   temperature <dbl>, temperature_quality <chr>,
#> #   temperature_dewpoint <dbl>, temperature_dewpoint_quality <chr>,
#> #   air_pressure <dbl>, air_pressure_quality <chr>,
#> #   AW1_present_weather_observation_identifier <chr>,
#> #   AW1_automated_atmospheric_condition_code <chr>,
#> #   AW1_quality_automated_atmospheric_condition_code <chr>,
#> #   N03_original_observation <chr>, N03_original_value_text <chr>,
#> #   N03_units_code <chr>, N03_parameter_code <chr>, REM_remarks <chr>,
#> #   REM_identifier <chr>, REM_length_quantity <chr>, REM_comment <chr>
```

process in parallel


```r
isd_parse(path, parallel = TRUE)
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/isdparser/issues).
* License: MIT
* Get citation information for `isdparser` in R doing `citation(package = 'isdparser')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![rofooter](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
