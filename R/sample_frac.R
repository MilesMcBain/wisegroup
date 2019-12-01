##' Ungrouping wrapper for sample_frac
##'
##' The wisegroup package provides a wrapper for sample_frac that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::sample_frac()].
##'
##' Use [sample_frac...()] to retain groups as per `dplyr::sample_frac`, whilst
##' signalling this in your code.
##'
##' @title sample_frac
##' @param ... parameters for dplyr::sample_frac
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::sample_frac, sample_frac...
sample_frac <- function(...) {
  dplyr::ungroup(
    dplyr::sample_frac(...)
  )
}

##' Grouping wrapper for sample_frac
##'
##' The wisegroup package provides a wrapper for sample_frac that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::sample_frac()].
##'
##' Use [wisegroup::sample_frac()] to automatically remove groups after applying dplyr::sample_frac.
##'
##' @title sample_frac
##' @param ... parameters for dplyr::sample_frac
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::sample_frac, sample_frac...
sample_frac... <- function(...) {
  dplyr::sample_frac(...)
}