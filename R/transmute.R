##' Ungrouping wrapper for transmute
##'
##' The wisegroup package provides a wrapper for transmute that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute()].
##'
##' Use [transmute...()] to retain groups as per `dplyr::transmute`, whilst
##' signalling this in your code.
##'
##' @title transmute
##' @param ... parameters for dplyr::transmute
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute, transmute...
transmute <- function(...) {
  dplyr::ungroup(
    dplyr::transmute(...)
  )
}

##' Grouping wrapper for transmute
##'
##' The wisegroup package provides a wrapper for transmute that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute()].
##'
##' Use [wisegroup::transmute()] to automatically remove groups after applying dplyr::transmute.
##'
##' @title transmute
##' @param ... parameters for dplyr::transmute
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute, transmute...
transmute... <- function(...) {
  dplyr::transmute(...)
}