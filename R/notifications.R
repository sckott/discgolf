#' Notifications data
#' 
#' @export
#' @param ... Named parameters passed on to [crul::verb-GET]
#' @examples \dontrun{
#' notifications()
#' }
notifications <- function(...) disc_GET("notifications.json", ...)
