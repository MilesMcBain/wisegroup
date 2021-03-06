% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/count.R
\name{count...}
\alias{count...}
\title{count}
\usage{
count...(...)
}
\arguments{
\item{...}{parameters for dplyr::count}
}
\value{
an ungrouped dataframe
}
\description{
Grouping wrapper for count
}
\details{
The wisegroup package provides a wrapper for count that behaves as per the
original with the added bonus of signalling returned data could be grouped in source code.
This helps avoid mistakes associated with forgetting to call ungroup().

For original documentation see \code{\link[dplyr:count]{dplyr::count()}}.

Use \code{\link[wisegroup:count]{wisegroup::count()}} to automatically remove groups after applying dplyr::count.
}
\seealso{
dplyr::count, count...
}
\author{
Miles McBain
}
