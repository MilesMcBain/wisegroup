##' Ungrouping wrapper for transmute_all
##'
##' The wisegroup package provides a wrapper for transmute_all that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute_all()].
##'
##' Use [transmute_all...()] to retain groups as per `dplyr::transmute_all`, whilst
##' signalling this in your code.
##'
##' @title transmute_all
##' @param ... parameters for dplyr::transmute_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute_all, transmute_all...
transmute_all <- function(...) {
  dplyr::ungroup(
    dplyr::transmute_all(...)
  )
}

##' Grouping wrapper for transmute_all
##'
##' The wisegroup package provides a wrapper for transmute_all that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::transmute_all()].
##'
##' Use [wisegroup::transmute_all()] to automatically remove groups after applying dplyr::transmute_all.
##'
##' @title transmute_all
##' @param ... parameters for dplyr::transmute_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::transmute_all, transmute_all...
transmute_all... <- function(...) {
  dplyr::transmute_all(...)
}