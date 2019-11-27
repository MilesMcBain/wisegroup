##' Ungrouping wrapper for mutate
##'
##' The wisegroup package provides a wrapper for mutate that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate()].
##'
##' Use [mutate...()] to retain groups as per `dplyr::mutate`, whilst
##' signalling this in your code.
##'
##' @title mutate
##' @param ... parameters for dplyr::mutate
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate, mutate...
mutate <- function(...) {
  dplyr::ungroup(
    dplyr::mutate(...)
  )
}

##' Grouping wrapper for mutate
##'
##' The wisegroup package provides a wrapper for mutate that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate()].
##'
##' Use [wisegroup::mutate()] to automatically remove groups after applying dplyr::mutate.
##'
##' @title mutate
##' @param ... parameters for dplyr::mutate
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate, mutate...
mutate... <- function(...) {
  dplyr::mutate(...)
}