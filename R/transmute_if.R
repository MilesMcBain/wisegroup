##' Ungrouping wrapper for transmute_if
##'
##' The wisegroup package provides a wrapper for transmute_if that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute_if()].
##'
##' Use [transmute_if...()] to retain groups as per `dplyr::transmute_if`, whilst
##' signalling this in your code.
##'
##' @title transmute_if
##' @param ... parameters for dplyr::transmute_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute_if, transmute_if...
transmute_if <- function(...) {
  dplyr::ungroup(
    dplyr::transmute_if(...)
  )
}

##' Grouping wrapper for transmute_if
##'
##' The wisegroup package provides a wrapper for transmute_if that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute_if()].
##'
##' Use [wisegroup::transmute_if()] to automatically remove groups after applying dplyr::transmute_if.
##'
##' @title transmute_if
##' @param ... parameters for dplyr::transmute_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute_if, transmute_if...
transmute_if... <- function(...) {
  dplyr::transmute_if(...)
}