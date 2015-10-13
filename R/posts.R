#' Work with posts
#'
#' @name posts
#' @param postid A post id
#' @param url Base url for a Discourse installation. Default is \url{http://discuss.ropensci.org}
#' @param key Your api key on the Discourse installation
#' @param user Your user name on the Discourse installation
#' @param ... Named parameters passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' # get a post
#' post_get(90)
#' post_get(120)
#' post_get(130)
#' post_get(155)
#' cat(post_get(155)$raw)
#'
#' # create post, create topic first
#' topic_create("The problem with blue skies", text = "just saying and all that")
#' post_create(topic_id = 13, text = "There isn't a problem!")
#' x <- topic(13)
#'
#' # edit the post
#' ## NOT WORKING YET
#' # topic(13)
#' # post_edit(id = x$post_stream$posts$id[2],
#' #          text = "There isn't a problem at all!")
#'
#' # Wikify a post
#' post_wikify(x$post_stream$posts$id[4])
#' }

#' @export
#' @rdname posts
post_get <- function(postid, url = NULL, key = NULL, user = NULL, ...) {
  args <- dc(list(api_key = check_key(key), api_username = check_user(user)))
  disc_GET(check_url(url), sprintf("posts/%s.json", postid), args, ...)
}

#' @export
#' @rdname posts
post_create <- function(topic_id, text, url=NULL, key=NULL, user=NULL, ...){
  args <- dc(list(api_key = check_key(key), api_username = check_user(user),
                  topic_id = topic_id, raw = text))
  disc_POST(check_url(url), "posts", args, ...)
}

#' @export
#' @rdname posts
post_edit <- function(id, text, url=NULL, key=NULL, user=NULL, ...){
  message("blarg, doesn't work yet")
  # args <- dc(list(api_key = check_key(key), api_username = check_user(user)))
  # disc_PUT(check_url(url), paste0("posts/%s", id), args,
  #          body = list(raw = text), ...)
}

#' @export
#' @rdname posts
post_wikify <- function(id, url=NULL, key=NULL, user=NULL, ...){
  args <- dc(list(api_key = check_key(key), api_username = check_user(user),
                  wiki = "true"))
  disc_PUT(check_url(url), sprintf("posts/%s/wiki", id), args, ...)
}
