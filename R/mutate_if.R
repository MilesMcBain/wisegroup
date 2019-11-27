##' Ungrouping wrapper for mutate_if
##'
##' The wisegroup package provides a wrapper for mutate_if that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate_if()].
##'
##' Use [mutate_if...()] to retain groups as per `dplyr::mutate_if`, whilst
##' signalling this in your code.
##'
##' @title mutate_if
##' @param ... parameters for dplyr::mutate_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate_if, mutate_if...
mutate_if <- function(...) {
  dplyr::ungroup(
    dplyr::mutate_if(...)
  )
}

##' Grouping wrapper for mutate_if
##'
##' The wisegroup package provides a wrapper for mutate_if that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate_if()].
##'
##' Use [wisegroup::mutate_if()] to automatically remove groups after applying dplyr::mutate_if.
##'
##' @title mutate_if
##' @param ... parameters for dplyr::mutate_if
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate_if, mutate_if...
mutate_if... <- function(...) {
  dplyr::mutate_if(...)
}