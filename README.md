isdparser
=========



`isdparser` is an parser for ISD/ISD NOAA files

Code liberated from `rnoaa` to focus on ISD parsing since it's sorta 
complicated. Has minimal dependencies, so you can parse your ISD/ISH
files without needing the deps that `rnoaa` needs. Will be used by 
`rnoaa` once on CRAN.

## API:

* `isd_parse()` - parse all lines in a file, with parallel option
* `isd_parse_line()` - parse a single line - you choose which lines to parse 
and how to apply the function to your lines

## Installation


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
#> # A tibble: 1 × 31
#>   total_chars usaf_station wban_station   date  time date_flag latitude
#>         <dbl>        <chr>        <chr> <date> <chr>     <chr>    <dbl>
#> 1          NA         <NA>         <NA>   <NA>  <NA>      <NA>       NA
#> # ... with 24 more variables: longitude <dbl>, type_code <chr>,
#> #   elevation <dbl>, call_letter <chr>, quality <chr>,
#> #   wind_direction <dbl>, wind_direction_quality <chr>, wind_code <chr>,
#> #   wind_speed <dbl>, wind_speed_quality <chr>, ceiling_height <chr>,
#> #   ceiling_height_quality <chr>, ceiling_height_determination <chr>,
#> #   ceiling_height_cavok <chr>, visibility_distance <chr>,
#> #   visibility_distance_quality <chr>, visibility_code <chr>,
#> #   visibility_code_quality <chr>, temperature <dbl>,
#> #   temperature_quality <chr>, temperature_dewpoint <dbl>,
#> #   temperature_dewpoint_quality <chr>, air_pressure <dbl>,
#> #   air_pressure_quality <chr>
```

Or, give back a list


```r
head(
  isd_parse_line(lns[1], as_data_frame = FALSE)
)
#> $total_chars
#> [1] NA
#> 
#> $usaf_station
#> [1] NA
#> 
#> $wban_station
#> [1] NA
#> 
#> $date
#> [1] NA
#> 
#> $time
#> [1] NA
#> 
#> $date_flag
#> [1] NA
```

### Parse an ISD file


```r
path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
isd_parse(path)
#> Error: file not found
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
