disc_GET <- function(url, endpt, args = list(), ...){
  url <- file.path(url, endpt)
  headers <- add_headers(Accept = 'application/json', user_agent = "discgolf R client")
  res <- GET(url, query = args, headers, ...)
  stop_for_status(res)
  stopifnot(res$headers$`content-type` == "application/json; charset=utf-8")
  res <- content(res, as = "text")
  jsonlite::fromJSON(res)
}

disc_POST <- function(url, endpt, args = list(), ...){
  url <- file.path(url, endpt)
  headers <- add_headers(Accept = 'application/json', user_agent = "discgolf R client")
  res <- POST(url, query = args, headers, ...)
  stop_for_status(res)
  stopifnot(res$headers$`content-type` == "application/json; charset=utf-8")
  res <- content(res, as = "text")
  jsonlite::fromJSON(res)
}

disc_DELETE <- function(url, endpt, args = list(), ...){
  url <- file.path(url, endpt)
  headers <- add_headers(Accept = 'application/json', user_agent = "discgolf R client")
  res <- DELETE(url, query = args, headers, ...)
  stop_for_status(res)
  stopifnot(res$headers$`content-type` == "text/plain; charset=utf-8")
  res$status_code == 200
}
