##' Ungrouping wrapper for mutate_at
##'
##' The wisegroup package provides a wrapper for mutate_at that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate_at()].
##'
##' Use [mutate_at...()] to retain groups as per `dplyr::mutate_at`, whilst
##' signalling this in your code.
##'
##' @title mutate_at
##' @param ... parameters for dplyr::mutate_at
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate_at, mutate_at...
mutate_at <- function(...) {
  dplyr::ungroup(
    dplyr::mutate_at(...)
  )
}

##' Grouping wrapper for mutate_at
##'
##' The wisegroup package provides a wrapper for mutate_at that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate_at()].
##'
##' Use [wisegroup::mutate_at()] to automatically remove groups after applying dplyr::mutate_at.
##'
##' @title mutate_at
##' @param ... parameters for dplyr::mutate_at
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate_at, mutate_at...
mutate_at... <- function(...) {
  dplyr::mutate_at(...)
}