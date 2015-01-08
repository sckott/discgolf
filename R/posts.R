#' Work with posts
#'
#' @name posts
#' @param postid A post id
#' @param url Base url for a Discourse installation. Default is \url{http://discuss.ropensci.org}
#' @param key Your api key on the Discourse installation
#' @param user Your user name on the Discourse installation
#' @param ... Named parameters passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' get_post(90)
#' get_post(120)
#' get_post(130)
#' get_post(155)
#' cat(get_post(155)$raw)
#' }

# #' @rdname posts
# edit_post <- function(url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
#   args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
#   disc_GET(url, "new.json", args, ...)
# }

#' @export
#' @rdname posts
get_post <- function(postid, url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, sprintf("posts/%s.json", postid), args, ...)
}

# #' @rdname posts
# create_post <- function(title, text, category=NULL, url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
#   args <- dc(list(api_key=check_key(key), api_username=check_user(user),
#                   title=title, raw=text, category=category))
#   disc_POST(url, endpt="posts", args, ...)
# }
