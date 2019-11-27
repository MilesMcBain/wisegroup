##' Ungrouping wrapper for summarize_all
##'
##' The wisegroup package provides a wrapper for summarize_all that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarize_all()].
##'
##' Use [summarize_all...()] to retain groups as per `dplyr::summarize_all`, whilst
##' signalling this in your code.
##'
##' @title summarize_all
##' @param ... parameters for dplyr::summarize_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarize_all, summarize_all...
summarize_all <- function(...) {
  dplyr::ungroup(
    dplyr::summarize_all(...)
  )
}

##' Grouping wrapper for summarize_all
##'
##' The wisegroup package provides a wrapper for summarize_all that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarize_all()].
##'
##' Use [wisegroup::summarize_all()] to automatically remove groups after applying dplyr::summarize_all.
##'
##' @title summarize_all
##' @param ... parameters for dplyr::summarize_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarize_all, summarize_all...
summarize_all... <- function(...) {
  dplyr::summarize_all(...)
}