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

context("Mutate")

test_that("repeated outputs applied progressively (data frame)", {
  df <- data.frame(x = 1)
  out <- mutate(df, z = x + 1, z = z + 1)

  expect_equal(nrow(out), 1)
  expect_equal(ncol(out), 2)

  expect_equal(out$z, 3)
})

test_that("repeated outputs applied progressively (grouped_df)", {
  df <- data.frame(x = c(1, 1), y = 1:2)
  ds <- dplyr::group_by(df, y)
  out <- mutate(ds, z = x + 1, z = z + 1)

  expect_equal(nrow(out), 2)
  expect_equal(ncol(out), 3)

  expect_equal(out$z, c(3L, 3L))
})

test_that("hybrid evaluation goes deep enough", {
  res1 <- iris %>% mutate(test = 1 == 2 | dplyr::row_number() < 10)
  res2 <- iris %>% mutate(test = dplyr::row_number() < 10 | 1 == 2)
  expect_equal(res1, res2)
})

test_that("grouped mutate does drop grouping attributes", {
  d <- data.frame(subject = c("Jack", "Jill"), id = c(2, 1)) %>%
    dplyr::group_by(subject)
  a1 <- names(attributes(dplyr::ungroup(d)))
  a2 <- names(attributes(d %>% mutate(foo = 1)))
  expect_equal(setdiff(a1, a2), character(0))
})

test_that("grouped mutate coerces factor + character -> character (WARN)", {
  factor_or_character <- function(x) {
    if (x > 3) {
      return(factor("hello"))
    } else {
      return("world")
    }
  }

  expect_warning({
  df <- tibble::tibble(
    id = c(1, 4),
    group = c("A", "B")
  ) %>%
    dplyr::group_by(group) %>%
    mutate(value = factor_or_character(id))
  },
  "binding character and factor")
  expect_type(df$value, "character")
  expect_identical(df$value, c("world", "hello"))
})

test_that("lead/lag works on more complex expressions (#1588)", {
  df <- tibble::tibble(x = rep(1:5, 2), g = rep(1:2, each = 5)) %>%
    dplyr::group_by(g)
  res <- df %>% mutate(y = dplyr::lead(x > 3))
  expect_equal(res$y, rep(dplyr::lead(1:5 > 3), 2))
})

## Window fn testing

test_that("desc is correctly handled by window functions", {
  df <- data.frame(
    x = 1:10, y = seq(1, 10, by = 1),
    g = rep(c(1, 2), each = 5), s = c(letters[1:3], LETTERS[1:5], letters[4:5])
  )

  expect_equal(mutate(df,
                      rank = dplyr::min_rank(dplyr::desc(x)))$rank, 10:1)
  expect_equal(mutate(dplyr::group_by(df, g),
                      rank = dplyr::min_rank(dplyr::desc(x)))$rank, rep(5:1, 2))

  expect_equal(mutate(df,
                      rank = dplyr::row_number(dplyr::desc(x)))$rank, 10:1)
  expect_equal(mutate(dplyr::group_by(df, g),
                      rank = dplyr::row_number(dplyr::desc(x)))$rank, rep(5:1, 2))

  # Test character vector sorting
  charvec_sort_test <- function(df) {
    expect_equal(
      mutate(df, rank = dplyr::row_number(dplyr::desc(s)))$rank,
      mutate(df, rank = dplyr::row_number(dplyr::desc(s)))$rank
    )
    expect_equal(
      mutate(dplyr::group_by(df, g), rank = dplyr::row_number(dplyr::desc(s)))$rank,
      mutate(dplyr::group_by(df, g), rank = dplyr::row_number(dplyr::desc(s)))$rank
    )
  }

  # Test against both the local, and the C locale for collation
  charvec_sort_test(df)
  withr::with_collate("C", charvec_sort_test(df))
})
