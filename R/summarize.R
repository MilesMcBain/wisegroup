##' Ungrouping wrapper for summarize
##'
##' The wisegroup package provides a wrapper for summarize that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarize()].
##'
##' Use [summarize...()] to retain groups as per `dplyr::summarize`, whilst
##' signalling this in your code.
##'
##' @title summarize
##' @param ... parameters for dplyr::summarize
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarize, summarize...
summarize <- function(...) {
  dplyr::ungroup(
    dplyr::summarize(...)
  )
}

##' Grouping wrapper for summarize
##'
##' The wisegroup package provides a wrapper for summarize that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarize()].
##'
##' Use [wisegroup::summarize()] to automatically remove groups after applying dplyr::summarize.
##'
##' @title summarize
##' @param ... parameters for dplyr::summarize
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarize, summarize...
summarize... <- function(...) {
  dplyr::summarize(...)
}