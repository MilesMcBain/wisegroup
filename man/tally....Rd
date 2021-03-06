% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tally.R
\name{tally...}
\alias{tally...}
\title{tally}
\usage{
tally...(...)
}
\arguments{
\item{...}{parameters for dplyr::tally}
}
\value{
an ungrouped dataframe
}
\description{
Grouping wrapper for tally
}
\details{
The wisegroup package provides a wrapper for tally that behaves as per the
original with the added bonus of signalling returned data could be grouped in source code.
This helps avoid mistakes associated with forgetting to call ungroup().

For original documentation see \code{\link[dplyr:tally]{dplyr::tally()}}.

Use \code{\link[wisegroup:tally]{wisegroup::tally()}} to automatically remove groups after applying dplyr::tally.
}
\seealso{
dplyr::tally, tally...
}
\author{
Miles McBain
}
