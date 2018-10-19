# file <- system.file("extdata/isd_metadata.csv", package = "isdparser")
# ff <- readr::read_csv(file)
# vapply(ff$dom, function(z) iconv(z, "latin1", "ASCII", sub = ""), "")
# ff$dom <- vapply(ff$dom, function(z) {
#   if (!stringi::stri_enc_isascii(z) && !is.na(z)) {
#     iconv(z, "latin1", "ASCII", sub = "")
#   } else {
#     z
#   }
# }, "", USE.NAMES = FALSE)

# foo <- function(x) {
#   starts <- gregexpr("[0-9A-Za-z]{1,7}\\s=|[0-9A-Za-z]{1,7}:\\s", x)[[1]]
#   out <- c()
#   for (i in seq_along(starts)) {
#     end <- if (i == length(starts)) nchar(x) else (starts[i + 1] - 1)
#     out[[i]] <- trimit(substring(x, starts[i], end))
#   }
#   unlist(lapply(out, function(w) {
#     tmp <- trimit(strsplit(w, split = ":|=")[[1]])
#     as.list(stats::setNames(tmp[2], tmp[1]))
#   }), FALSE)
# }

# ff$dom_parsed <- lapply(ff$dom, foo)
# ff$dom_parsed_json <- vapply(ff$dom_parsed, jsonlite::toJSON, "", auto_unbox = TRUE)
# ff$dom_parsed <- lapply(ff$dom_parsed_json, jsonlite::fromJSON)
