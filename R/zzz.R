dc <- function(x) Filter(Negate(is.null), x)

check_url <- function() {
  tmp <- Sys.getenv("DISCOURSE_URL", "")
  if (tmp == "") getOption("discourse_url", stop("need a Discourse url")) else tmp
}

check_key <- function() {
  tmp <- Sys.getenv("DISCOURSE_API_KEY", "")
  if (tmp == "") getOption("discourse_api_key", stop("need an API key for Discourse")) else tmp
}

check_user <- function() {
  tmp <- Sys.getenv("DISCOURSE_USERNAME", "")
  if (tmp == "") getOption("discourse_username", stop("need a Discourse username")) else tmp
}
