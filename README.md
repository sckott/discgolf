discgolf
========



[![cran checks](https://cranchecks.info/badges/worst/discgolf)](https://cranchecks.info/pkgs/discgolf)
[![Build Status](https://travis-ci.org/sckott/discgolf.svg)](https://travis-ci.org/sckott/discgolf)
[![codecov.io](https://codecov.io/github/sckott/discgolf/coverage.svg?branch=master)](https://codecov.io/github/sckott/discgolf?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/discgolf?color=FAB657)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/discgolf)](https://cran.r-project.org/package=discgolf)

`discgolf` is an R client for the Discourse API, inspired by the Ruby gem [discourse_api](https://github.com/discourse/discourse_api)

Discourse API docs: <https://docs.discourse.org>

## Installation

CRAN version


```r
install.packages("discgolf")
```

Development version


```r
install.packages("remotes")
remotes::install_github("sckott/discgolf")
```


```r
library("discgolf")
```

## Authentication

The Discourse API is based on using a specific installation of Discourse, which requires your username and an API key for that installation. Get those, and you can pass them in to each function call, or set as option variables in `.Rprofile` (use `discourse_api_key` and `discourse_username`) or environment variables in `.Renviron` (use `DISCOURSE_API_KEY` and `DISCOURSE_USERNAME`).

## Get latest topics


```r
topics_latest()
```


```r
topics_latest()$topic_list$topics[,c(1:5)]
```

## Get new topics


```r
topics_new()
```

## Get topics by a specific user


```r
topics_by("cboettig")
```

## Get a single topic by id number


```r
topic(8)
```


```r
topic(8)$post_stream$posts[,c(1:5)]
```

## Get a post


```r
post_get(90)
```

## create post, create topic first


```r
topic_create("The problem with blue skies", text = "just saying and all that")
post_create(topic_id = 13, text = "There isn't a problem!")
```

## Wikify a post


```r
post_wikify(x$post_stream$posts$id[4])
```

## Search


```r
dg_search(query = "poo")
dg_search(posts_count = 1)
dg_search(in_ = "posted")
dg_search(status = "open")
```

## list a user


```r
user('sckott')
user('cboettig')
```

## list users


```r
users_list('staff')
users_list('new')
```

## create a user


```r
(x <- user_create("jane doe", "jane@doe.com", "jane_doe", "afafasfdasdf"))
```

## activate a user


```r
user_activate(x$user_id)
```

## upate email address


```r
user_update_email('jane_doe', 'jane2@doe.com')
```

## upate user name


```r
user_update_username('jane_doe', 'jane_doe2')
```

## delete a user


```r
user_delete(x$user_id)
```

## Meta

* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
