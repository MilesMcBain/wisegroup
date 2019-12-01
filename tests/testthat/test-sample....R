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

context("Sample...")

test_that("grouped sample respects weight", {
  df2 <- tibble::tibble(
    x = rep(1:2, 100),
    y = rep(c(0, 1), 100),
    g = rep(1:2, each = 100)
  )

  grp <- df2 %>% dplyr::group_by(g)

  # error message from base R
  expect_error(sample_n...(grp, nrow(df2) / 2, weight = y))
  expect_equal(sample_n...(grp, 1, weight = y)$x, c(2, 2))

  # error message from base R
  expect_error(sample_frac...(grp, 1, weight = y))
  expect_equal(sample_frac...(grp, 0.5, weight = y)$x, rep(2, nrow(df2) / 2))
})

test_that("grouped sample accepts NULL weight from variable (for saeSim)", {
  df <- tibble::tibble(
    x = rep(1:2, 10),
    y = rep(c(0, 1), 10),
    g = rep(1:2, each = 10)
  )

  weight <- NULL

  expect_error(sample_n...(df, nrow(df), weight = weight), NA)
  expect_error(sample_frac...(df, weight = weight), NA)

  grp <- df %>% dplyr::group_by(g)

  expect_error(sample_n...(grp, nrow(df) / 2, weight = weight), NA)
  expect_error(sample_frac...(grp, weight = weight), NA)
})

test_that("sample_n and sample_frac can call n() (#3413)", {
  df <- tibble::tibble(
    x = rep(1:2, 10),
    y = rep(c(0, 1), 10),
    g = rep(1:2, each = 10)
  )
  gdf <- dplyr::group_by(df, g)

  expect_equal(sample_n...(df, dplyr::n()), df)
  expect_equal(sample_n...(gdf, dplyr::n()), gdf)

  expect_equal(nrow(sample_n...(df, dplyr::n()-2L)), nrow(df)-2)
  expect_equal(nrow(sample_n...(gdf, dplyr::n()-2L)), nrow(df)-4)
})

test_that("sample_n and sample_frac handles lazy grouped data frames (#3380)", {
  df1 <- data.frame(x = 1:10, y = rep(1:2, each=5))
  df2 <- data.frame(x = 6:15, z = 1:10)
  res <- df1 %>% dplyr::group_by(y) %>% dplyr::anti_join(df2, by="x") %>% sample_n...(1)
  expect_equal(nrow(res), 1L)

  res <- df1 %>% dplyr::group_by(y) %>% dplyr::anti_join(df2, by="x") %>% sample_frac...(0.2)
  expect_equal(nrow(res), 1L)
})
