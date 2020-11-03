#' Work with groups
#'
#' @export
#' @param name (character) A group name. required
#' @param id (numeric) A group id. required
#' @template args
#' @examples \dontrun{
#' # all groups
#' groups()
#'
#' # specific group by name
#' group_members("admins")
#' group_members("moderators")
#' group_members("trust_level_3")
#'
#' # create a group
#' (res <- group_create("group_testing2"))
#'
#' # delete a group
#' group_delete(res$basic_group$id)
#' }
groups <- function(...) {
  disc_GET("admin/groups.json", args, ...)
}

#' @export
#' @rdname groups
group_members <- function(name, ...) {
  disc_GET(sprintf("groups/%s/members.json", name), ...)
}

#' @export
#' @rdname groups
group_create <- function(name, ...) {
  body <- dc(list(`group[name]` = name))
  disc_POST("admin/groups", body = body, ...)
}

#' @export
#' @rdname groups
group_delete <- function(id, ...) {
  disc_DELETE(sprintf("admin/groups/%s.json", id), ...)
}
