#' Get the latest topics
#'
#' @export
#' @param url Base url for a Discourse installation. Default is \url{http://discuss.ropensci.org}
#' @param key Your api key on the Discourse installation
#' @param user Your user name on the Discourse installation
#' @param ... Named parameters passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' latest_topics()
#'
#' library("httr")
#' latest_topics(config=verbose())
#' }

latest_topics <- function(url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, args, ...)
}
