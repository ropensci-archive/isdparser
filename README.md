isdparser
=========



`isdparser` is an parser for ISD/ISD NOAA files

## Installation


```r
devtools::install_github("ropenscilabs/isdparser")
```


```r
library('isdparser')
```

### Parse an ISD file


```r
path <- system.file('extdata/725300-94846-2014.gz', package = "isdparser")
isd_parser(path)
#> # A tibble: 13,087 × 252
#>    total_chars usaf_station wban_station       date  time date_flag
#>          <dbl>        <chr>        <chr>     <date> <chr>     <chr>
#> 1          227       725300        94846 2014-01-01  0000         4
#> 2          193       725300        94846 2014-01-01  0049         6
#> 3          250       725300        94846 2014-01-01  0051         7
#> 4          243       725300        94846 2014-01-01  0108         7
#> 5          243       725300        94846 2014-01-01  0117         7
#> 6          250       725300        94846 2014-01-01  0151         7
#> 7          340       725300        94846 2014-01-01  0251         7
#> 8          277       725300        94846 2014-01-01  0300         7
#> 9          239       725300        94846 2014-01-01  0339         7
#> 10         284       725300        94846 2014-01-01  0351         7
#> # ... with 13,077 more rows, and 246 more variables: latitude <dbl>,
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
#> #   AA1_precipitation_liquid <chr>, AA1_period_quantity_hrs <chr>,
#> #   AA1_depth <chr>, AA1_condition_quality <chr>, AA1_quality_code <chr>,
#> #   AJ1_snow_depth <chr>, AJ1_depth <chr>, AJ1_condition_code <chr>,
#> #   AJ1_quality_code <chr>, AJ1_equivalent_water_depth <chr>,
#> #   AJ1_equivalent_water_condition_code <chr>,
#> #   AJ1_equivalent_water_condition_quality_code <chr>,
#> #   GE1_sky_condition <chr>, GE1_connective_cloud_attribute <chr>,
#> #   GE1_vertical_datum_attribute <chr>,
#> #   GE1_base_height_upper_range_attribute <chr>,
#> #   GE1_base_height_lower_range_attribute <chr>, REM_remarks <chr>,
#> #   REM_identifier <chr>, REM_length_quantity <chr>, REM_comment <chr>,
#> #   GF1_sky_condition <chr>, GF1_coverage <chr>,
#> #   GF1_opaque_coverage <chr>, GF1_coverage_quality <chr>,
#> #   GF1_lowest_cover <chr>, GF1_lowest_cover_quality <chr>,
#> #   GF1_low_cloud_genus <chr>, GF1_low_cloud_genus_quality <chr>,
#> #   GF1_lowest_cloud_base_height <chr>,
#> #   GF1_lowest_cloud_base_height_quality <chr>, GF1_mid_cloud_genus <chr>,
#> #   GF1_mid_cloud_genus_quality <chr>, GF1_high_cloud_genus <chr>,
#> #   GF1_high_cloud_genus_quality <chr>, KA1_extreme_temp <chr>,
#> #   KA1_period_quantity <chr>, KA1_max_min <chr>, KA1_temp <chr>,
#> #   KA1_temp_quality <chr>, KA2_extreme_temp <chr>,
#> #   KA2_period_quantity <chr>, KA2_max_min <chr>, KA2_temp <chr>,
#> #   KA2_temp_quality <chr>, MA1_atmospheric_pressure <chr>,
#> #   MA1_altimeter_setting_rate <chr>, MA1_altimeter_quality_code <chr>,
#> #   MA1_station_pressure_rate <chr>,
#> #   MA1_station_pressure_quality_code <chr>,
#> #   MW1_first_weather_reported <chr>, MW1_condition <chr>,
#> #   MW1_condition_quality <chr>,
#> #   AU1_present_weather_observation_identifier_asos_awos <chr>,
#> #   AU1_intensity_and_proximity_code <chr>, AU1_descriptor_code <chr>,
#> #   AU1_precipitation_code <chr>, AU1_obscuration_code <chr>,
#> #   AU1_other_weather_phenomena_code <chr>,
#> #   AU1_combination_indicator_code <chr>, AU1_quality_code <chr>,
#> #   AW1_present_weather_observation_identifier <chr>,
#> #   AW1_automated_atmospheric_condition_code <chr>,
#> #   AW1_quality_automated_atmospheric_condition_code <chr>,
#> #   GA1_sky_cover_layer_identifier <chr>, GA1_coverage_code <chr>,
#> #   GA1_coverage_quality_code <chr>, GA1_base_height_dimension <chr>,
#> #   GA1_base_height_quality_code <chr>, GA1_cloud_type_code <chr>,
#> #   GA1_cloud_type_quality_code <chr>,
#> #   GD1_sky_cover_summation_state_identifier <chr>,
#> #   GD1_coverage_code_1 <chr>, GD1_coverage_code_2 <chr>,
#> #   GD1_coverage_quality_code <chr>, ...
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/isdparser/issues).
* License: MIT
* Get citation information for `isdparser` in R doing `citation(package = 'isdparser')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![rofooter](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
