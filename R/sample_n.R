##' Ungrouping wrapper for sample_n
##'
##' The wisegroup package provides a wrapper for sample_n that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::sample_n()].
##'
##' Use [sample_n...()] to retain groups as per `dplyr::sample_n`, whilst
##' signalling this in your code.
##'
##' @title sample_n
##' @param ... parameters for dplyr::sample_n
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::sample_n, sample_n...
sample_n <- function(...) {
  dplyr::ungroup(
    dplyr::sample_n(...)
  )
}

##' Grouping wrapper for sample_n
##'
##' The wisegroup package provides a wrapper for sample_n that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::sample_n()].
##'
##' Use [wisegroup::sample_n()] to automatically remove groups after applying dplyr::sample_n.
##'
##' @title sample_n
##' @param ... parameters for dplyr::sample_n
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::sample_n, sample_n...
sample_n... <- function(...) {
  dplyr::sample_n(...)
}