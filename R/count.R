##' Ungrouping wrapper for count
##'
##' The wisegroup package provides a wrapper for count that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::count()].
##'
##' Use [count...()] to retain groups as per `dplyr::count`, whilst
##' signalling this in your code.
##'
##' @title count
##' @param ... parameters for dplyr::count
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::count, count...
count <- function(...) {
  dplyr::ungroup(
    dplyr::count(...)
  )
}

##' Grouping wrapper for count
##'
##' The wisegroup package provides a wrapper for count that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::count()].
##'
##' Use [wisegroup::count()] to automatically remove groups after applying dplyr::count.
##'
##' @title count
##' @param ... parameters for dplyr::count
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::count, count...
count... <- function(...) {
  dplyr::count(...)
}