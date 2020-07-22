context("posts")

test_that("fails well with no input", {
  skip_on_cran()

  bb <- post_get(120)
  # cc <- post_get(130)

  expect_is(bb, "list")
  expect_is(bb$name, "character")
  expect_is(bb$actions_summary, "list")
  expect_equal(bb$username, "bw4sz")

  # expect_is(cc, "list")
  # expect_is(cc$name, "character")
  # expect_is(cc$actions_summary, "data.frame")
  # expect_equal(cc$username, "sckott")
})

test_that("fails well with no input", {
  skip_on_cran()

  expect_error(post_get(), "argument \"post_id\" is missing")
})

test_that("fails well with non-existent page", {
  skip_on_cran()

  expect_error(post_get("asfafsfadfasdfd"), class = "http_404")
})

test_that("curl options work", {
  skip_on_cran()

  expect_error(post_get("asdfadf", timeout_ms = 1))
})
