##' Ungrouping wrapper for add_tally
##'
##' The wisegroup package provides a wrapper for add_tally that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::add_tally()].
##'
##' Use [add_tally...()] to retain groups as per `dplyr::add_tally`, whilst
##' signalling this in your code.
##'
##' @title add_tally
##' @param ... parameters for dplyr::add_tally
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::add_tally, add_tally...
add_tally <- function(...) {
  dplyr::ungroup(
    dplyr::add_tally(...)
  )
}

##' Grouping wrapper for add_tally
##'
##' The wisegroup package provides a wrapper for add_tally that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::add_tally()].
##'
##' Use [wisegroup::add_tally()] to automatically remove groups after applying dplyr::add_tally.
##'
##' @title add_tally
##' @param ... parameters for dplyr::add_tally
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::add_tally, add_tally...
add_tally... <- function(...) {
  dplyr::add_tally(...)
}