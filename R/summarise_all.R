##' Ungrouping wrapper for summarise_all
##'
##' The wisegroup package provides a wrapper for summarise_all that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise_all()].
##'
##' Use [summarise_all...()] to retain groups as per `dplyr::summarise_all`, whilst
##' signalling this in your code.
##'
##' @title summarise_all
##' @param ... parameters for dplyr::summarise_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise_all, summarise_all...
summarise_all <- function(...) {
  dplyr::ungroup(
    dplyr::summarise_all(...)
  )
}

##' Grouping wrapper for summarise_all
##'
##' The wisegroup package provides a wrapper for summarise_all that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::summarise_all()].
##'
##' Use [wisegroup::summarise_all()] to automatically remove groups after applying dplyr::summarise_all.
##'
##' @title summarise_all
##' @param ... parameters for dplyr::summarise_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::summarise_all, summarise_all...
summarise_all... <- function(...) {
  dplyr::summarise_all(...)
}