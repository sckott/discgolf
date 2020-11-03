disc_verb <- function(verb, endpt, args = list(), body = list(), ...) {
  headers_auth <- list('Api-Key' = check_key(), 'Api-Username' = check_user())
  cli <- crul::HttpClient$new(
    url = as.url(check_url(), endpt),
    headers = c(dg_head(), headers_auth),
    opts = list(...)
  )
  res <- switch(verb,
    GET = cli$get(query = args),
    POST = cli$post(query = args, body = body),
    PUT = cli$put(query = args, body = body),
    DELETE = cli$delete(query = args)
  )
  res$raise_for_status()
  check_res(res)
  return(res)
}

disc_GET <- function(endpt, args = list(), ...) {
  x <- disc_verb("GET", endpt, args, ...)
  parse_json(x)
}

disc_POST <- function(endpt, args = list(), body = list(), ...) {
  x <- disc_verb("POST", endpt, args, body, ...)
  parse_json(x)
}

disc_PUT <- function(endpt, args = list(), body = list(), ...) {
  x <- disc_verb("PUT", endpt, args, body, ...)
  parse_log(x)
}

disc_DELETE <- function(endpt, args = list(), ...) {
  x <- disc_verb("DELETE", endpt, args, ...)
  parse_log(x)
}

check_res <- function(x) {
  if (x$status_code > 201) {
    err <- err_handle(x)
    stop(err$status, " - ",
         err$mssg,
         call. = FALSE)
  }
}

parse_json <- function(x) {
  stopifnot(
    x$response_headers$`content-type` == "application/json; charset=utf-8")
  res <- x$parse("UTF-8")
  jsonlite::fromJSON(res)
}

parse_log <- function(x) {
  stopifnot(
    x$response_headers$`content-type` %in%
      c("application/json; charset=utf-8",
        "text/plain; charset=utf-8",
        "text/html; charset=utf-8"))
  x$status_code == 200
}

dg_head <- function() {
  list(Accept = 'application/json', `User-Agent` = "discgolf R client")
}

as.url <- function(x, y) file.path(x, y)

err_handle <- function(y) {
  z <- y$parse("UTF-8")
  if (nchar(z) == 0) {
    list(status = y$status_code,
         mssg = y$status_http()$explanation)
  } else {
    if (grepl("html", y$response_headers$`content-type`)) {
      html <- xml2::read_html(z)
      list(status = y$status_code,
           mssg = xml2::xml_text(xml2::xml_find_first(html, "//h1"))
      )
    } else {
      bb <- jsonlite::fromJSON(z)
      msg <- if (inherits(bb, "list")) unlist(bb$errors) else bb
      list(status = y$status_code, mssg = msg)
    }
  }
}

disc_paginate <- function(endpt, args = list(), ...) {
  out <- list()
  not_done <- TRUE
  i <- 0
  while (not_done) {
    i <- i + 1
    tmp <- disc_GET(endpt, args, ...)
    mtu <- tmp$topic_list$more_topics_url
    if (is.null(mtu)) not_done <- FALSE
    if (!is.null(mtu)) {
      z <- crul::url_parse(mtu)
      args$page <- z$parameter$page
    }
    out[[i]] <- tmp
  }
  return(out)  
}
