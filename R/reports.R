#' Reports
#'
#' @name reports
#' @param start_date,end_date start and end dates
#' @param category_id a category id
#' @param group_id a group id
#' @param url Base url for a Discourse installation. See 
#' [disc_setup]
#' @param key Your api key on the Discourse installation. See 
#' [disc_setup]
#' @param ... Named parameters passed on to [crul::verb-GET]
#' @examples \dontrun{
#' x <- reports_page_views(start_date = "2019-08-01", end_date = "2019-09-11")
#' }

#' @export
#' @rdname reports
reports_page_views <- function(start_date, end_date, category_id = NULL,
  group_id = NULL, url = NULL, key = NULL, ...) {

  args <- dc(list(api_key = check_key(key), start_date = start_date,
    end_date = end_date, category_id = category_id, group_id = group_id))
  disc_GET(check_url(url), "page_view_total_reqs", args, ...)
}
