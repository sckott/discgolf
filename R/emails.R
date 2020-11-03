#' Email
#'
#' @name email
#' @export
#' @param filter An email filter, one of received, sent, skipped, rejected
#' @template args
#' @examples \dontrun{
#' # email settings
#' email_settings()
#'
#' # list settings for an email address
#' list_email("received")
#' }
email_settings <- function(...) {
  disc_GET("admin/email.json", ...)
}

#' @export
#' @rdname email
list_email <- function(filter, ...) {
  disc_GET(sprintf("admin/email/%s.json", filter), ...)
}
