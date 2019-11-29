
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wisegroup

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/milesmcbain/wisegroup.svg?branch=master)](https://travis-ci.org/milesmcbain/wisegroup)
<!-- badges: end -->

> Now I am become death, destroyer of groups….

Never be burned by forgetting to `ungroup()` again.

This packages contains wrappers for common group-aware functions that
either:

  - automatically ungroup the returned data OR
  - allow the developer to make explicit that groups are being carried
    forward, signalling the potential for group related errors with a
    ‘…’ variant of the orignal function, e.g. `mutate...`,
    `summarise...` etc.

## Installation

``` r
remotes::install_github("milesmcbain/wisegroup")
```

## Usage

`wisegroup` is designed to mask `tidyverse` functions in your global
environment. It is recommended that you use this package in conjunction
with `conflicted`. This means that the order of the `library` calls will
not matter, and t that the masking is made explicit like so:

``` r

library(conflicted)
library(tidyverse)
#> ── Attaching packages ────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.2.0     ✔ purrr   0.3.2
#> ✔ tibble  2.1.3     ✔ dplyr   0.8.3
#> ✔ tidyr   0.8.3     ✔ stringr 1.4.0
#> ✔ readr   1.3.1     ✔ forcats 0.4.0
#> ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
library(wisegroup)
library(nycflights13)

conflict_prefer("summarise", "wisegroup")
#> [conflicted] Will prefer wisegroup::summarise over any other package
conflict_prefer("mutate", "wisegroup")
#> [conflicted] Will prefer wisegroup::mutate over any other package
```

Just be lazy. `conflicted` will let you know when you need to
disambiguate.

So now you have automatically dropped groups after summarising over
multiple grouping columns:

``` r
flights %>%
  group_by(year, month, day) %>%
  summarise(max_delay = max(dep_delay, na.rm = TRUE))
#> # A tibble: 365 x 4
#>     year month   day max_delay
#>    <int> <int> <int>     <dbl>
#>  1  2013     1     1       853
#>  2  2013     1     2       379
#>  3  2013     1     3       291
#>  4  2013     1     4       288
#>  5  2013     1     5       327
#>  6  2013     1     6       202
#>  7  2013     1     7       366
#>  8  2013     1     8       188
#>  9  2013     1     9      1301
#> 10  2013     1    10      1126
#> # … with 355 more rows
```

You indicate the grouping is sticking around with the `...` suffix

``` r

flights %>%
  group_by(year, month, day) %>%
  summarise...(max_delay = max(dep_delay, na.rm = TRUE))
#> # A tibble: 365 x 4
#> # Groups:   year, month [12]
#>     year month   day max_delay
#>    <int> <int> <int>     <dbl>
#>  1  2013     1     1       853
#>  2  2013     1     2       379
#>  3  2013     1     3       291
#>  4  2013     1     4       288
#>  5  2013     1     5       327
#>  6  2013     1     6       202
#>  7  2013     1     7       366
#>  8  2013     1     8       188
#>  9  2013     1     9      1301
#> 10  2013     1    10      1126
#> # … with 355 more rows
```

and with mutate:

``` r
flights %>%
  group_by(year, month, day) %>%
  mutate...(day_dep_variance = var(dep_delay, na.rm = TRUE)) %>%
  summarise(max_var = max(day_dep_variance))
#> # A tibble: 365 x 4
#>     year month   day max_var
#>    <int> <int> <int>   <dbl>
#>  1  2013     1     1   2049.
#>  2  2013     1     2   1384.
#>  3  2013     1     3    990.
#>  4  2013     1     4    769.
#>  5  2013     1     5    662.
#>  6  2013     1     6    537.
#>  7  2013     1     7    733.
#>  8  2013     1     8    374.
#>  9  2013     1     9   2197.
#> 10  2013     1    10   1924.
#> # … with 355 more rows
```

## Fun Fact

This package generates it’s own source and documentation, so that adding
new wrappers is low effort. To generate new wrappers, an entry is added
to “./group\_aware\_functions.R” and “./make.R” is run. The goal of
wisegroup is to …
