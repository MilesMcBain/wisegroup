##' Ungrouping wrapper for summarise
##'
##' The wisegroup package provides a wrapper for summarise that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise()].
##'
##' Use [summarise...()] to retain groups as per `dplyr::summarise`, whilst
##' signalling this in your code.
##'
##' @title summarise
##' @param ... parameters for dplyr::summarise
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise, summarise...
summarise <- function(...) {
  dplyr::ungroup(
    dplyr::summarise(...)
  )
}

##' Grouping wrapper for summarise
##'
##' The wisegroup package provides a wrapper for summarise that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise()].
##'
##' Use [wisegroup::summarise()] to automatically remove groups after applying dplyr::summarise.
##'
##' @title summarise
##' @param ... parameters for dplyr::summarise
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise, summarise...
summarise... <- function(...) {
  dplyr::summarise(...)
}