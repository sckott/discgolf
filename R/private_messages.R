#' Private messages
#'
#' @export
#' @param username A username. required.
#' @param ... Named parameters passed on to [crul::verb-GET]
#' @examples \dontrun{
#' private_messages(username = "sckott")
#' }
private_messages <- function(username, ...) {
  disc_GET(sprintf("topics/private-messages/%s.json", username), ...)
}
