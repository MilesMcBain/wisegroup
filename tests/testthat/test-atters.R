## This file contains code taken from dplyr. The license and copyright is:

## The MIT License (MIT)
## =====================

## Copyright © 2013-2019 RStudio and others.

## Permission is hereby granted, free of charge, to any person
## obtaining a copy of this software and associated documentation
## files (the “Software”), to deal in the Software without
## restriction, including without limitation the rights to use,
## copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the
## Software is furnished to do so, subject to the following
## conditions:

## The above copyright notice and this permission notice shall be
## included in all copies or substantial portions of the Software.

## THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
## OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
## NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
## HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
## WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
## FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
## OTHER DEALINGS IN THE SOFTWARE.

context("colwise mutate/summarise")

test_that("funs found in current environment", {
  f <- function(x) 1
  df <- data.frame(x = c(2:10, 1000))


  out <- summarise_all(df, list(f = f, mean = mean, median = median))
  expect_equal(out, data.frame(f = 1, mean = 105.4, median = 6.5))
  # TODO: expect_error(summarise_all(df, list(f, mean, median)))
})

test_that("can use character vectors", {
  df <- data.frame(x = 1:3)

  expect_equal(summarise_all(df, "mean"), summarise_all(df, funs(mean)))
  expect_equal(mutate_all(df, list(mean = "mean")), mutate_all(df, funs(mean = mean)))

  expect_equal(summarise_all(df, "mean"), summarise_all(df, list(mean)))
  expect_equal(mutate_all(df, list(mean = "mean")), mutate_all(df, list(mean = mean)))
})

test_that("can use bare functions", {
  df <- data.frame(x = 1:3)

  expect_equal(summarise_all(df, mean), summarise_all(df, funs(mean)))
  expect_equal(mutate_all(df, mean), mutate_all(df, funs(mean)))

  expect_equal(summarise_all(df, mean), summarise_all(df, list(mean)))
  expect_equal(mutate_all(df, mean), mutate_all(df, list(mean)))
})


test_that("non syntactic colnames work", {
  df <- tibble::tibble(`x 1` = 1:3)
  expect_identical(summarise_at(df, "x 1", sum)[[1]], 6L)
  expect_identical(summarise_all(df, sum)[[1]], 6L)
  expect_identical(mutate_all(df, `*`, 2)[[1]], (1:3) * 2)
})

test_that("selection works with grouped data frames (#2624)", {
  gdf <- dplyr::group_by(iris, Species)
  expect_identical(mutate_if(gdf, is.factor, as.character),
                   dplyr::ungroup(gdf))
})

test_that("summarise_at removes grouping variables (#3613)", {
  d <- tibble::tibble( x = 1:2, y = 3:4, g = 1:2) %>%
    dplyr::group_by(g)
  res <- d %>%
   dplyr::group_by(g) %>%
    summarise_at(-1, mean)

  expect_equal(names(res), c("g", "y"))
})
