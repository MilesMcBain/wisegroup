##' Ungrouping wrapper for slice
##'
##' The wisegroup package provides a wrapper for slice that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::slice()].
##'
##' Use [slice...()] to retain groups as per `dplyr::slice`, whilst
##' signalling this in your code.
##'
##' @title slice
##' @param ... parameters for dplyr::slice
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::slice, slice...
slice <- function(...) {
  dplyr::ungroup(
    dplyr::slice(...)
  )
}

##' Grouping wrapper for slice
##'
##' The wisegroup package provides a wrapper for slice that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::slice()].
##'
##' Use [wisegroup::slice()] to automatically remove groups after applying dplyr::slice.
##'
##' @title slice
##' @param ... parameters for dplyr::slice
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::slice, slice...
slice... <- function(...) {
  dplyr::slice(...)
}