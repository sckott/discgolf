
<!-- README.md is generated from README.Rmd. Please edit that file -->

# discgolf

[![cran
checks](https://cranchecks.info/badges/worst/discgolf)](https://cranchecks.info/pkgs/discgolf)
[![R-check](https://github.com/sckott/discgolf/workflows/R-check/badge.svg)](https://github.com/sckott/discgolf/actions?query=workflow%3AR-check)
[![codecov.io](https://codecov.io/github/sckott/discgolf/coverage.svg?branch=master)](https://codecov.io/github/sckott/discgolf?branch=master)
[![rstudio mirror
downloads](https://cranlogs.r-pkg.org/badges/discgolf?color=FAB657)](https://github.com/r-hub/cranlogs.app)
[![cran
version](https://www.r-pkg.org/badges/version/discgolf)](https://cran.r-project.org/package=discgolf)

`discgolf` is an R client for the Discourse API

Discourse API docs: <https://docs.discourse.org/>

discgolf package docs: <https://sckott.github.io/discgolf/>

## Installation

CRAN version

``` r
install.packages("discgolf")
```

Development version

``` r
install.packages("remotes")
remotes::install_github("sckott/discgolf")
```

``` r
library("discgolf")
```

## Authentication

The Discourse API is based on using a specific installation of
Discourse, which requires the URL of the target Discourse forum, your
username and an API key for that installation. Get those, set as option
variables in `.Rprofile` (use `discourse_url`, `discourse_username` and
`discourse_api_key`) or environment variables in `.Renviron` (use
`DISCOURSE_URL`, `DISCOURSE_USERNAME` and `DISCOURSE_API_KEY`) or
similar file (`.bashrc`, `.zshrc`, etc.).

## Get latest topics

``` r
topics_latest()
```

``` r
topics_latest()$topic_list$topics[,c(1:5)]
```

## Get new topics

``` r
topics_new()
```

## Get topics by a specific user

``` r
topics_by("cboettig")
```

## Get a single topic by id number

``` r
topic(8)
```

``` r
topic(8)$post_stream$posts[,c(1:5)]
```

## Get a post

``` r
post_get(90)
```

## Create post, create topic first

``` r
topic_create("The problem with blue skies", text = "just saying and all that")
post_create(topic_id = 13, text = "There isn't a problem!")
```

## Wikify a post

``` r
post_wikify(x$post_stream$posts$id[4])
```

## Search

``` r
dg_search(query = "poo")
dg_search(posts_count = 1)
dg_search(in_ = "posted")
dg_search(status = "open")
```

## List a user

``` r
user('sckott')
user('cboettig')
```

## List users

``` r
users_list('staff')
users_list('new')
```

## Create a user

``` r
(x <- user_create("jane doe", "jane@doe.com", "jane_doe", "afafasfdasdf"))
```

## Activate a user

``` r
user_activate(x$user_id)
```

## Update email address

``` r
user_update_email('jane_doe', 'jane2@doe.com')
```

## Update user name

``` r
user_update_username('jane_doe', 'jane_doe2')
```

## Delete a user

``` r
user_delete(x$user_id)
```

## Meta

  - Please note that this project is released with a [Contributor Code
    of
    Conduct](https://github.com/sckott/discgolf/blob/master/CODE_OF_CONDUCT.md).
    By participating in this project you agree to abide by its terms.
