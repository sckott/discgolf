#' Get the latest topics
#'
#' @import httr jsonlite
#' @name topics
#' @param url Base url for a Discourse installation. Default is \url{http://discuss.ropensci.org}
#' @param id A user identifier, or a topic identifier. See examples.
#' @param key Your api key on the Discourse installation
#' @param user Your user name on the Discourse installation
#' @param ... Named parameters passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' latest_topics()
#' new_topics()
#' topics_by("cboettig")
#' topic(8)
#'
#' library("httr")
#' latest_topics(config=verbose())
#' }

#' @export
#' @rdname topics
latest_topics <- function(url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, "latest.json", args, ...)
}

#' @export
#' @rdname topics
new_topics <- function(url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, "new.json", args, ...)
}

#' @export
#' @rdname topics
topics_by <- function(id, url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, sprintf("topics/created-by/%s.json", id), args, ...)
}

#' @export
#' @rdname topics
topic <- function(id, url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, sprintf("t/%s.json", id), args, ...)
}
