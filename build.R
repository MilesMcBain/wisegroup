PKGNAME <- "wisegroup"

build_fn <- function(fn) {

  fn_name <- name(fn)

  glue::glue("{fn_name} <- function(...) {{\n",
             "  dplyr::ungroup(\n",
             "    {fn}(...)\n",
             "  )\n",
             "}}\n")

}

build_..._fn <- function(fn) {

  fn_name <- name(fn)

  glue::glue("{fn_name}... <- function(...) {{\n",
             "  {fn}(...)\n",
             "}}\n")
  
}

build_fn_doco <- function(fn) {

  fn_name <- name(fn)

  glue::glue(
    "##' Ungrouping wrapper for {fn_name}\n",
    "##'\n",
    "##' The {PKGNAME} package provides a wrapper for {fn_name} that always returns\n",
    "##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().\n",
    "##'\n",
    "##' For original documentation see [{fn}()].\n",
    "##'\n",
    "##' Use [{fn_name}...()] to retain groups as per `{fn}`, whilst\n",
    "##' signalling this in your code.\n",
    "##'\n",
    "##' @title {fn_name}\n",
    "##' @param ... parameters for {fn}\n",
    "##' @return an ungrouped dataframe\n",
    "##' @author Miles McBain\n",
    "##' @export\n",
    "##' @seealso {fn}, {fn_name}..."
  )

}

build_..._fn_doco <- function(fn) {

  fn_name <- name(fn)

  glue::glue(
          "##' Grouping wrapper for {fn_name}\n",
          "##'\n",
          "##' The {PKGNAME} package provides a wrapper for {fn_name} that behaves as per the\n",
          "##' original with the added bonus of signalling returned data could be grouped in source code.\n",
          "##' This helps avoid mistakes associated with forgetting to call ungroup().\n",
          "##'\n",
          "##' For original documentation see [{fn}()].\n",
          "##'\n",
          "##' Use [{PKGNAME}::{fn_name}()] to automatically remove groups after applying {fn}.\n",
          "##'\n",
          "##' @title {fn_name}\n",
          "##' @param ... parameters for {fn}\n",
          "##' @return an ungrouped dataframe\n",
          "##' @author Miles McBain\n",
          "##' @export\n",
          "##' @seealso {fn}, {fn_name}..."
        )

}

write_fn <- function(fn) {

  fn_name <- name(fn)

  wrappers <-
    paste0(
      build_fn_doco(fn), "\n",
      build_fn(fn), "\n\n",
      build_..._fn_doco(fn), "\n",
      build_..._fn(fn)
    )

  readr::write_file(wrappers,
                    glue::glue("./R/{fn_name}.R"))

}

build_pkg <- function() {

  lapply(GROUP_AWARE_FUNCTIONS,
         write_fn)

  invisible(NULL)

}

namespace <- function(fn) gsub("::.*", "", fn)

name <- function(fn) gsub("[^:]+::", "", fn)

