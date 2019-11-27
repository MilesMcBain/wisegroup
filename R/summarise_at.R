##' Ungrouping wrapper for summarise_at
##'
##' The wisegroup package provides a wrapper for summarise_at that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise_at()].
##'
##' Use [summarise_at...()] to retain groups as per `dplyr::summarise_at`, whilst
##' signalling this in your code.
##'
##' @title summarise_at
##' @param ... parameters for dplyr::summarise_at
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise_at, summarise_at...
summarise_at <- function(...) {
  dplyr::ungroup(
    dplyr::summarise_at(...)
  )
}

##' Grouping wrapper for summarise_at
##'
##' The wisegroup package provides a wrapper for summarise_at that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise_at()].
##'
##' Use [wisegroup::summarise_at()] to automatically remove groups after applying dplyr::summarise_at.
##'
##' @title summarise_at
##' @param ... parameters for dplyr::summarise_at
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise_at, summarise_at...
summarise_at... <- function(...) {
  dplyr::summarise_at(...)
}