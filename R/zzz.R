dc <- function(x) Filter(Negate(is.null), x)

disc_GET <- function(url, endpt, args = list(), ...){
  url <- file.path(url, endpt)
  headers <- add_headers(Accept='application/json', user_agent="discgolf R client")
  res <- GET(url, query = args, headers, ...)
  stop_for_status(res)
  stopifnot(res$headers$`content-type` == "application/json; charset=utf-8")
  res <- content(res, as = "text")
  jsonlite::fromJSON(res)
}

check_key <- function(x){
  tmp <- if(is.null(x)) Sys.getenv("DISCOURSE_API_KEY", "") else x
  if(tmp == "") getOption("discourse_api_key", stop("need an API key for Discourse")) else tmp
}

check_user <- function(x){
  tmp <- if(is.null(x)) Sys.getenv("DISCOURSE_USERNAME", "") else x
  if(tmp == "") getOption("discourse_username", stop("need a Discourse username")) else tmp
}

# api_key = ENV["DISCOURSE_API_KEY"],
# api_username = ENV["DISCOURSE_USERNAME"]

disc_POST <- function(url, endpt, args = list(), ...){
  url <- file.path(url, endpt)
  headers <- add_headers(Accept='application/json', user_agent="discgolf R client")
  res <- POST(url, query = args, headers, ...)
  stop_for_status(res)
  stopifnot(res$headers$`content-type` == "application/json; charset=utf-8")
  res <- content(res, as = "text")
  jsonlite::fromJSON(res)
}
