isdparser 0.2.0
===============

### NEW FEATURES

* New function `isd_transform()` that transforms some variables in 
ISD output data - but not all. This functionality used to be done
by default in `isd_parse()` and `isd_parse_line()` - but data transforming 
yanked out as separate step done with `isd_transform()` (#11)
* Both `isd_parse()` and `isd_parse_line()` gain new parameter 
`additional` to optionally include additional and remarks
data sections in output (#10)

### BUG FIXES

* Fixed a bug in `isd()` in which a data section was not parsed 
correctly. (#9)


isdparser 0.1.0
===============

### NEW FEATURES

* Released to CRAN.
