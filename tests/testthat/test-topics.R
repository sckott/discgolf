context("topics")

test_that("fails well with no input", {
  expect_error(topic(), "argument \"id\" is missing")
})

test_that("fails well with non-existent droplet", {
	skip_on_cran()

  expect_error(topic("asfafsfadfasdfd"),
               "The page you requested doesn't exist or is private")
})

test_that("httr curl options work", {
	skip_on_cran()

  library("httr")
  expect_error(topic("asdfadf", config = timeout(seconds = 0.001)))
})
