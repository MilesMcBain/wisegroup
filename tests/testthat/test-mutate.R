## tests taken from dplyr

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
