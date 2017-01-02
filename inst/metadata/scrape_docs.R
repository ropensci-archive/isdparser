##
by_line <- function(x) {
  on.exit(closeAllConnections())
  readLines(textConnection(x))
}

strex <- function(str, pattern) {
  regmatches(str, regexpr(pattern, str))
}

`%||%` <- function(x, y) if (is.null(x) || length(x) == 0) y else x

#
library(pdftools)
pdf <- pdftools::pdf_text("inst/isddocs/ish-format-document.pdf")

lns <- do.call("c", lapply(pdf, by_line))
pos_starts <- grep("FLD LEN:|POS:", lns)

out <- list()
for (i in seq_along(pos_starts)) {
  lns_sub <- lns[c(pos_starts[i]:(pos_starts[min(c(i + 1, length(pos_starts)))] - 1))]
  tmp <- list(
    min = sub("MIN:\\s+", "", strex(lns_sub, "MIN:\\s+-?\\+?[0-9]+")) %||% NA,
    max = sub("MAX:\\s+", "", strex(lns_sub, "MAX:\\s+-?\\+?[0-9]+")) %||% NA,
    units = sub("UNITS:\\s+", "", strex(lns_sub, "UNITS:\\s+.+")) %||% NA,
    scaling_factor = sub("SCALING FACTOR:\\s+", "", strex(lns_sub, "SCALING FACTOR:\\s+[0-9]+")) %||% NA,
    missing = sub("\\s=\\sMissing", "", strex(lns_sub, "-?\\+?[0-9]+\\s=\\sMissing")) %||% NA,
    dom = {
      if (length(grep("DOM:", lns_sub)) == 0) {
        NA
      } else {
        sub(
          "DOM:\\s+",
          "",
          gsub("\\s\\s+", " ", paste0(lns_sub[grep("DOM:", lns_sub)[1]:length(lns_sub)], collapse = ""))
        ) %||% NA
      }
    }
  )
  if (grepl("POS", lns_sub[1])) {
    tmp$pos <- sub("POS:\\s+", "", strex(lns_sub, "POS:\\s+.+"))
  } else {
    tmp$field_length <- sub("FLD LEN:\\s+", "", strex(lns_sub, "FLD LEN:\\s+.+"))
  }
  out[[i]] <- tmp
}

library(dplyr)
(df <- bind_rows(out) %>% select(pos, field_length, min, max, units, scaling_factor, missing, dom))

# control + mandatory data sections
df %>% filter(!is.na(pos)) %>% select(-field_length) %>% data.frame

#
df %>% filter(!is.na(scaling_factor))
df %>% filter(!is.na(units))
df %>% filter(!is.na(field_length))
df %>% filter(!is.na(missing))


# fixes
df[df$pos == "28-28", ]
