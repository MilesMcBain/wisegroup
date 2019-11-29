context("Summarise...")


test_that("summarise... does not remove all layers of grouping", {
  df <- tibble::tibble(x = rep(1:4, each = 4), y = rep(1:2, each = 8), z = runif(16))
  grouped <- df %>% dplyr::group_by(x, y, z)
  expect_equal(dplyr::group_vars(grouped), c("x", "y", "z"))
  expect_equal(dplyr::group_vars(grouped %>% summarise...(n = dplyr::n())), c("x", "y"))
})
