#' Work with users
#'
#' @name users
#' @param username A user name
#' @param type A type of user, one of active, staff, new, suspended,
#' blocked, or suspect
#' @param name a name
#' @param email an email address
#' @param password a password
#' @param user_id a user id
#' @param new_username a username
#' @param page (integer) a page number for pagination. records per page
#' is fixed at 100 (that is: up to 100)
#' @template args
#' @section users_list:
#' note that there is no paging, so if you have more than 100 users, you only
#' get the first 100. :sad panda:
#' @examples \dontrun{
#' # list a user
#' user('sckott')
#' user('cboettig')
#'
#' # list users
#' users_list('staff')
#' users_list('new')
#' NROW(users_list('active', page = 1))
#' NROW(users_list('active', page = 2))
#'
#' # create a user
#' (x <- user_create("jane doe", "janie@doe.com", "jane_doe",
#'   "fTh6bmoPaaWrlI5fLDM6wy"))
#'
#' # activate a user
#' user_activate(x$user_id)
#'
#' # upate email address
#' user_update_email(username = 'jane_doe', email = 'jane2@doe.com')
#'
#' # upate user name
#' user_update_username('jane_doe', 'jane_doe5')
#'
#' # delete a user
#' user_delete(x$user_id)
#' }

#' @export
#' @rdname users
user <- function(username, ...) {
  disc_GET(sprintf("users/%s.json", username), ...)
}

#' @export
#' @rdname users
users_list <- function(type, page=NULL, ...) {
  args <- dc(list(page = page))
  disc_GET(sprintf("admin/users/list/%s.json", type), ...)
}

#' @export
#' @rdname users
user_create <- function(name, email, username, password, ...) {
  body <- dc(list(name = name, email = email, username = username,
    password = password))
  disc_POST("users", body = body, ...)
}

#' @export
#' @rdname users
user_activate <- function(user_id, ...) {
  disc_PUT(sprintf("admin/users/%s/activate", user_id), ...)
}

#' @export
#' @rdname users
user_delete <- function(user_id, ...) {
  disc_DELETE(sprintf("admin/users/%s", user_id), args, ...)
}

#' @export
#' @rdname users
user_update_email <- function(username, email, ...) {
  disc_PUT(sprintf("users/%s/preferences/email", username),
    body = dc(list(email = email)), ...)
}

#' @export
#' @rdname users
user_update_username <- function(username, new_username, ...) {
  disc_PUT(sprintf("users/%s/preferences/username", username),
    body = dc(list(new_username = new_username)), ...)
}
