##' Ungrouping wrapper for summarise_if
##'
##' The wisegroup package provides a wrapper for summarise_if that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise_if()].
##'
##' Use [summarise_if...()] to retain groups as per `dplyr::summarise_if`, whilst
##' signalling this in your code.
##'
##' @title summarise_if
##' @param ... parameters for dplyr::summarise_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise_if, summarise_if...
summarise_if <- function(...) {
  dplyr::ungroup(
    dplyr::summarise_if(...)
  )
}

##' Grouping wrapper for summarise_if
##'
##' The wisegroup package provides a wrapper for summarise_if that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise_if()].
##'
##' Use [wisegroup::summarise_if()] to automatically remove groups after applying dplyr::summarise_if.
##'
##' @title summarise_if
##' @param ... parameters for dplyr::summarise_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise_if, summarise_if...
summarise_if... <- function(...) {
  dplyr::summarise_if(...)
}