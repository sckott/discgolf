#' Work with categories
#'
#' @name categories
#' @param category Category name. required
#' @param color A color by name or hex string. optional
#' @param text_color A color by name or hex string. optional
#' @param description Description of the category. optional
#' @param permissions Permissions - a list with the group name and permission_type
#' which is an integer: 1 = Full, 2 = Create Post, 3 = Read Only. optional
#' @param parent_category x. optional
#' @param page (integer) a page number for pagination. records per page
#' is fixed at 30 (that is: up to 30). default: 1
#' @template args
#' @details Apprently there's no ability to delete categories via the API.
#' @examples \dontrun{
#' # all categories
#' categories()
#'
#' # a specfic category
#' category("usecases")
#' category("packages")
#'
#' # latest topics for a category
#' category_latest_topics("packages")
#' out <- category_latest_topics(category="usecases", page = NULL)
#' out
#'
#' # top topics for a category
#' category_top_topics("packages")
#'
#' # new topics for a category
#' category_new_topics("packages")
#'
#' # create a category
#' category_create("stuff3", "F7941D", "FFFFFF", "My new category")
#' }
categories <- function(...) {
  disc_GET("categories.json", ...)
}

#' @export
#' @rdname categories
category <- function(category, page = 1, ...) {
  args <- dc(list(page = page))
  disc_GET(sprintf("c/%s.json", category), args, ...)
}

#' @export
#' @rdname categories
category_latest_topics <- function(category, page = 1, ...) {
  args <- dc(list(page = page))
  path <- sprintf("c/%s/l/latest.json", category)
  if (is.null(page)) return(disc_paginate(path, args, ...))
  disc_GET(path, args, ...)
}

#' @export
#' @rdname categories
category_top_topics <- function(category,   page = 1, ...) {
  args <- dc(list(page = page))
  disc_GET(sprintf("c/%s/l/top.json", category), args, ...)
}

#' @export
#' @rdname categories
category_new_topics <- function(category, ...) {
  disc_GET(sprintf("c/%s/l/new.json", category), ...)
}

#' @export
#' @rdname categories
category_create <- function(category, color, text_color, description = NULL,
  permissions = NULL, parent_category = NULL, ...) {

  body <- dc(list(name = category, color = color, text_color = text_color,
                  description = description, permissions = permissions,
                  parent_category_id = parent_category))
  disc_POST("categories", body = body, ...)
}
