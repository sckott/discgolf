context("topics")

test_that("fails well with no input", {
	skip_on_cran()

  expect_error(topic(), "argument \"id\" is missing")
})

test_that("fails well with non-existent page", {
	skip_on_cran()

  expect_error(topic("asfafsfadfasdfd"), "404")
})

test_that("curl options work", {
	skip_on_cran()

  expect_error(topic("asdfadf", timeout_ms = 1))
})
