#' Search
#'
#' @export
#' @param query (character) Query terms. Required.
#' @param order (character) One of views, latest, likes
#' @param status (character) One of open, closed, archived, noreplies,
#' or single_user
#' @param category (character) Category to search for
#' @param username (character) User name
#' @param group (character) Groupo name
#' @param badge (character) Badge name
#' @param in_ (character) One of likes, posted, watching, tracking, private,
#' bookmarks, first
#' @param posts_count (integer) Number of posts per topic
#' @param min_age (integer) Minimum age
#' @param max_age (integer) Maximum age
#' @param page (integer) a page number for pagination. records per page
#' is fixed at 50 (that is: up to 50). default: 1
#' @template args
#' @details This uses the `/search` API route
#' 
#' all parameters except `page` are combined into a single 
#' API query parameter called `q`, separated with `+`. individual parameters
#' are collapsed with colons. So a function call like 
#' `dg_search(query = "tags:r", page = 1)` will turn in to 
#' `/search?q=tags:r&page=1`
#' 
#' Parameters not defined here can still be passed to `query`, with a
#' pattern `a:b`, where `a` is the field to query on, and `b` is the 
#' term passed to `a`. See example below for `tags`
#' 
#' @examples \dontrun{
#' dg_search(query = "tags:r", page = 1)
#' dg_search(query = "tags:r", page = 2)
#' dg_search(query = "tags:r", page = 3)
#' dg_search(query = "poo")
#' dg_search(posts_count = 2, status = "open")
#' dg_search(in_ = "posted")
#' dg_search(status = "open")
#' }
dg_search <- function(query = NULL, order = NULL, status = NULL, category = NULL,
  username = NULL, group = NULL, badge = NULL, in_ = NULL, posts_count = NULL,
  min_age = NULL, max_age = NULL, page = 1, ...) {

  args <- dc(list(q = query))
  other_args <- dc(list(order = order, status = status, category = category,
    user = username, group = group, badge = badge, `in` = in_,
    posts_count = posts_count, min_age = min_age, max_age))
  oa <- paste0(paste(names(other_args), unlist(unname(other_args)), sep = ":"),
               collapse = "+")
  if (nzchar(oa)) args$q <- paste0(args$q, "+", oa)
  args <- dc(c(args, list(page = page)))
  disc_GET("search", args, ...)
}
