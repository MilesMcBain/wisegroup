##' Ungrouping wrapper for summarize_if
##'
##' The wisegroup package provides a wrapper for summarize_if that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarize_if()].
##'
##' Use [summarize_if...()] to retain groups as per `dplyr::summarize_if`, whilst
##' signalling this in your code.
##'
##' @title summarize_if
##' @param ... parameters for dplyr::summarize_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarize_if, summarize_if...
summarize_if <- function(...) {
  dplyr::ungroup(
    dplyr::summarize_if(...)
  )
}

##' Grouping wrapper for summarize_if
##'
##' The wisegroup package provides a wrapper for summarize_if that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarize_if()].
##'
##' Use [wisegroup::summarize_if()] to automatically remove groups after applying dplyr::summarize_if.
##'
##' @title summarize_if
##' @param ... parameters for dplyr::summarize_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarize_if, summarize_if...
summarize_if... <- function(...) {
  dplyr::summarize_if(...)
}