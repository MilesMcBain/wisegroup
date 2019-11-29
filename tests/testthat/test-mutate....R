
context("Mutate...")

test_that("grouped mutate... does not drop grouping attributes", {
  d <- data.frame(subject = c("Jack", "Jill"), id = c(2, 1)) %>%
    dplyr::group_by(subject)
  a1 <- names(attributes(d))
  a2 <- names(attributes(d %>% mutate...(foo = 1)))
  expect_equal(setdiff(a1, a2), character(0))
})

test_that("repeated outputs applied progressively (data frame)", {
  df <- data.frame(x = 1)
  out <- mutate...(df, z = x + 1, z = z + 1)

  expect_equal(nrow(out), 1)
  expect_equal(ncol(out), 2)

  expect_equal(out$z, 3)
})

test_that("repeated outputs applied progressively (grouped_df)", {
  df <- data.frame(x = c(1, 1), y = 1:2)
  ds <- dplyr::group_by(df, y)
  out <- mutate...(ds, z = x + 1, z = z + 1)

  expect_equal(nrow(out), 2)
  expect_equal(ncol(out), 3)

  expect_equal(out$z, c(3L, 3L))
})
