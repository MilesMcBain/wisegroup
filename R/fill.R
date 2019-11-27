##' Ungrouping wrapper for fill
##'
##' The wisegroup package provides a wrapper for fill that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [tidyr::fill()].
##'
##' Use [fill...()] to retain groups as per `tidyr::fill`, whilst
##' signalling this in your code.
##'
##' @title fill
##' @param ... parameters for tidyr::fill
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso tidyr::fill, fill...
fill <- function(...) {
  dplyr::ungroup(
    tidyr::fill(...)
  )
}

##' Grouping wrapper for fill
##'
##' The wisegroup package provides a wrapper for fill that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [tidyr::fill()].
##'
##' Use [wisegroup::fill()] to automatically remove groups after applying tidyr::fill.
##'
##' @title fill
##' @param ... parameters for tidyr::fill
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso tidyr::fill, fill...
fill... <- function(...) {
  tidyr::fill(...)
}