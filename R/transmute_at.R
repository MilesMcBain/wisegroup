##' Ungrouping wrapper for transmute_at
##'
##' The wisegroup package provides a wrapper for transmute_at that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute_at()].
##'
##' Use [transmute_at...()] to retain groups as per `dplyr::transmute_at`, whilst
##' signalling this in your code.
##'
##' @title transmute_at
##' @param ... parameters for dplyr::transmute_at
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute_at, transmute_at...
transmute_at <- function(...) {
  dplyr::ungroup(
    dplyr::transmute_at(...)
  )
}

##' Grouping wrapper for transmute_at
##'
##' The wisegroup package provides a wrapper for transmute_at that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute_at()].
##'
##' Use [wisegroup::transmute_at()] to automatically remove groups after applying dplyr::transmute_at.
##'
##' @title transmute_at
##' @param ... parameters for dplyr::transmute_at
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute_at, transmute_at...
transmute_at... <- function(...) {
  dplyr::transmute_at(...)
}