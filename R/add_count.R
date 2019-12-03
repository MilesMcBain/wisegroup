##' Ungrouping wrapper for add_count
##'
##' The wisegroup package provides a wrapper for add_count that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::add_count()].
##'
##' Use [add_count...()] to retain groups as per `dplyr::add_count`, whilst
##' signalling this in your code.
##'
##' @title add_count
##' @param ... parameters for dplyr::add_count
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::add_count, add_count...
add_count <- function(...) {
  dplyr::ungroup(
    dplyr::add_count(...)
  )
}

##' Grouping wrapper for add_count
##'
##' The wisegroup package provides a wrapper for add_count that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::add_count()].
##'
##' Use [wisegroup::add_count()] to automatically remove groups after applying dplyr::add_count.
##'
##' @title add_count
##' @param ... parameters for dplyr::add_count
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::add_count, add_count...
add_count... <- function(...) {
  dplyr::add_count(...)
}