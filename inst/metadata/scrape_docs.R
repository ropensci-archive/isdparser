## functions
by_line <- function(x) {
  on.exit(closeAllConnections())
  readLines(textConnection(x))
}

strex <- function(str, pattern) {
  regmatches(str, regexpr(pattern, str))
}

`%||%` <- function(x, y) if (is.null(x) || length(x) == 0) y else x

fixit <- function(x, pos, col, replace) {
  x <- dplyr::filter(x, !is.na(pos))
  x <- as.data.frame(x)
  x[x$pos == pos, col] <- replace
  tibble::as_tibble(x)
}

trimit <- function(x) {
  gsub("\\s\\s+", " ", gsub("^\\s+|\\s+$", "", x))
}


# scrape it
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
    },
    description = {
      tmp <- lns[pos_starts[i] + 2]
      if (!grepl("[a-z]", tmp)) {
        iter <- 2
        while (!grepl("[a-z]", tmp)) {
          iter <- iter + 1
          tmp <- lns[pos_starts[i] + iter]
        }
      }
      if (grepl("\\.$", tmp)) {
        trimit(tmp)
      } else {
        trimit(paste0(c(tmp, lns[pos_starts[i] + 3]), collapse = " "))
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
(df <- bind_rows(out) %>% select(pos, field_length, min, max, units, scaling_factor, missing, dom, description))

# control + mandatory data sections
df %>% filter(!is.na(pos)) %>% select(-field_length) %>% data.frame

# peeking at various issues
df %>% filter(!is.na(scaling_factor))
df %>% filter(!is.na(units))
df %>% filter(!is.na(field_length))
df %>% filter(!is.na(missing))

# control + mandatory fixes
cm <- dplyr::filter(df, !is.na(pos))
cm <- as.data.frame(cm)
cm[cm$pos == "28-28", "max"] <- "Z"
cm[cm$pos == "77-77", "missing"] <- 9
cm[cm$pos == "78-78", "missing"] <- 9
cm[cm$pos == "79-84", "missing"] <- 999999
df <- as_data_frame(bind_rows(cm, dplyr::filter(df, is.na(pos))))

# additional data sections
df %>% filter(is.na(pos)) %>% select(-dom) %>% data.frame %>% head(n = 50)
## fixes
## FLD LEN: 1 LIQUID-PRECIPITATION condition code

