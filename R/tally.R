##' Ungrouping wrapper for tally
##'
##' The wisegroup package provides a wrapper for tally that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::tally()].
##'
##' Use [tally...()] to retain groups as per `dplyr::tally`, whilst
##' signalling this in your code.
##'
##' @title tally
##' @param ... parameters for dplyr::tally
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::tally, tally...
tally <- function(...) {
  dplyr::ungroup(
    dplyr::tally(...)
  )
}

##' Grouping wrapper for tally
##'
##' The wisegroup package provides a wrapper for tally that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::tally()].
##'
##' Use [wisegroup::tally()] to automatically remove groups after applying dplyr::tally.
##'
##' @title tally
##' @param ... parameters for dplyr::tally
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::tally, tally...
tally... <- function(...) {
  dplyr::tally(...)
}