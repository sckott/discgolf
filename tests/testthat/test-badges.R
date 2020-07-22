context("badges")

# FIXME: for some reason this isn't working, works in the browser but not here
# test_that("badges works as expected", {
#   skip_on_cran()

#   aa <- badges()

#   expect_is(aa, "list")
#   expect_named(aa, c('badges', 'badge_types', 'badge_groupings', 'admin_badges'))

#   expect_is(aa$admin_badges, "list")

#   expect_is(aa$badges, "data.frame")
#   expect_is(aa$badge_types, "data.frame")
#   expect_is(aa$badge_groupings, "data.frame")

#   expect_is(aa$badges$name, "character")
# })

test_that("badges_user works as expected", {
  skip_on_cran()

  aa <- badges_user("sckott")

  expect_is(aa, "list")
  expect_named(aa, c('user_badges', 'badges', 'badge_types', 'users', 'user'))

  expect_is(aa$user, "list")

  expect_is(aa$user_badges, "data.frame")
  expect_is(aa$badges, "data.frame")
  expect_is(aa$badge_types, "data.frame")
  expect_is(aa$users, "data.frame")

  expect_is(aa$user_badges$granted_at, "character")
})

test_that("badges_user fails well with no input", {
  skip_on_cran()

  expect_error(badges_user(), "argument \"username\" is missing")
})

test_that("badge_creatse fails well with no input", {
  skip_on_cran()

  expect_error(badge_create(), "argument \"name\" is missing")
})

test_that("fails well with non-existent user", {
  skip_on_cran()

  expect_error(badges_user("asfafsfadfasdfd"), class = "http_404")
})

test_that("curl options work", {
  skip_on_cran()

  expect_error(badges(timeout_ms = 1))
})
