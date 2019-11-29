context("Summarise")

## tests taken from dplyr

test_that("repeated outputs applied progressively (grouped_df)", {
  df <- data.frame(x = c(1, 1), y = 1:2)
  ds <- dplyr::group_by(df, y)
  out <- summarise(ds, z = mean(x), z = z + 1)

  expect_equal(nrow(out), 2)
  expect_equal(ncol(out), 2)

  expect_equal(out$z, c(2L, 2L))
})

test_that("summarise removes all layers of grouping", {
  df <- tibble::tibble(x = rep(1:4, each = 4), y = rep(1:2, each = 8), z = runif(16))
  grouped <- df %>% dplyr::group_by(x, y, z)
  expect_equal(dplyr::group_vars(grouped), c("x", "y", "z"))
  expect_equal(dplyr::group_vars(grouped %>% summarise(n = dplyr::n())), character(0))
})

test_that("summarise refuses to modify grouping variable ", {
  df <- data.frame(a = c(1, 2, 1, 2), b = c(1, 1, 2, 2), x = 1:4)
  ds <- dplyr::group_by(dplyr::tbl_df(df), a, b)
  expect_error(
    summarise(ds, a = mean(x), a = b + 1),
    "Column `a` can't be modified because it's a grouping variable"
  )
})

test_that("summarise handles passing ...", {
  df <- data.frame(x = 1:4)

  f <- function(...) {
    x1 <- 1
    f1 <- function(x) x
    summarise(df, ..., x1 = f1(x1))
  }
  g <- function(...) {
    x2 <- 2
    f(x2 = x2, ...)
  }
  h <- function(before = "before", ..., after = "after") {
    g(before = before, ..., after = after)
  }

  res <- h(x3 = 3)
  expect_equal(res$x1, 1)
  expect_equal(res$x2, 2)
  expect_equal(res$before, "before")
  expect_equal(res$after, "after")

  df <- dplyr::tbl_df(df)
  res <- h(x3 = 3)
  expect_equal(res$x1, 1)
  expect_equal(res$x2, 2)
  expect_equal(res$before, "before")
  expect_equal(res$after, "after")

  df <- dplyr::group_by(df, x)
  res <- h(x3 = 3)
  expect_equal(res$x1, rep(1, 4))
  expect_equal(res$x2, rep(2, 4))
  expect_equal(res$before, rep("before", 4))
  expect_equal(res$after, rep("after", 4))
})
