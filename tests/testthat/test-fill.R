## This file contains code from tidyr. The license and copyright is:

## Copyright (c) 2014, Hadley Wickham and RStudio

## Permission is hereby granted, free of charge, to any person obtaining
## a copy of this software and associated documentation files (the
## "Software"), to deal in the Software without restriction, including
## without limitation the rights to use, copy, modify, merge, publish,
## distribute, sublicense, and/or sell copies of the Software, and to
## permit persons to whom the Software is furnished to do so, subject to
## the following conditions:

## The above copyright notice and this permission notice shall be
## included in all copies or substantial portions of the Software.

## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
## MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
## NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
## LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
## OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
## WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

context("fill")

test_that("missings filled up for each vector", {
  df <- tibble::tibble(
    lgl = c(NA, T),
    int = c(NA, 1L),
    dbl = c(NA, 1),
    chr = c(NA, "a"),
    lst = list(NULL, 1:5)
  )

  out <- fill(df, lgl, int, dbl,
                       chr, lst, .direction = "up")
  expect_equal(out$lgl, c(TRUE, TRUE))
  expect_equal(out$int, c(1L, 1L))
  expect_equal(out$dbl, c(1, 1))
  expect_equal(out$chr, c("a", "a"))
  expect_equal(out$lst, list(1:5, 1:5))

})

test_that("fill respects grouping", {
  df <- tibble::tibble(x = c(1, 1, 2), y = c(1, NA, NA))
  out <- df %>% dplyr::group_by(x) %>% fill(y)
  expect_equal(out$y, c(1, 1, NA))
})
