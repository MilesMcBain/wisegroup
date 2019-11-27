##' Ungrouping wrapper for mutate_all
##'
##' The wisegroup package provides a wrapper for mutate_all that always returns
##' ungrouped data. This avoids mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate_all()].
##'
##' Use [mutate_all...()] to retain groups as per `dplyr::mutate_all`, whilst
##' signalling this in your code.
##'
##' @title mutate_all
##' @param ... parameters for dplyr::mutate_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate_all, mutate_all...
mutate_all <- function(...) {
  dplyr::ungroup(
    dplyr::mutate_all(...)
  )
}

##' Grouping wrapper for mutate_all
##'
##' The wisegroup package provides a wrapper for mutate_all that behaves as per the
##' original with the added bonus of signalling returned data could be grouped in source code.
##' This helps avoid mistakes associated with forgetting to call ungroup().
##'
##' For original documentation see [dplyr::mutate_all()].
##'
##' Use [wisegroup::mutate_all()] to automatically remove groups after applying dplyr::mutate_all.
##'
##' @title mutate_all
##' @param ... parameters for dplyr::mutate_all
##' @return an ungrouped dataframe
##' @author Miles McBain
##' @export
##' @seealso dplyr::mutate_all, mutate_all...
mutate_all... <- function(...) {
  dplyr::mutate_all(...)
}