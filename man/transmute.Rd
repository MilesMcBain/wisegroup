% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transmute.R
\name{transmute}
\alias{transmute}
\title{transmute}
\usage{
transmute(...)
}
\arguments{
\item{...}{parameters for dplyr::transmute}
}
\value{
an ungrouped dataframe
}
\description{
Ungrouping wrapper for transmute
}
\details{
The wisegroup package provides a wrapper for transmute that always returns
ungrouped data. This avoids mistakes associated with forgetting to call ungroup().

For original documentation see \code{\link[dplyr:transmute]{dplyr::transmute()}}.

Use \code{\link[=transmute...]{transmute...()}} to retain groups as per \code{dplyr::transmute}, whilst
signalling this in your code.
}
\seealso{
dplyr::transmute, transmute...
}
\author{
Miles McBain
}
