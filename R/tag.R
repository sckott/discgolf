#' Tag data
#'
#' @param tag A tag name
#' @template args
#' @examples \dontrun{
#' tag('r')
#' tag('geospatial')
#' }
tag <- function(tag, ...) {
  disc_GET(sprintf("tags/%s.json", tag), ...)
}
