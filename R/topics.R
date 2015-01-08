#' Get the latest topics
#'
#' @import httr jsonlite
#' @name topics
#' @param url Base url for a Discourse installation. Default is \url{http://discuss.ropensci.org}
#' @param id A user identifier, or a topic identifier. See examples.
#' @param key Your api key on the Discourse installation
#' @param user Your user name on the Discourse installation
#' @param title Title of the new topic
#' @param text Raw text, can include markdown and will be rendered.
#' @param category Category to apply to topic, if any, Default: none
#' @param ... Named parameters passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' latest_topics()
#' new_topics()
#' topics_by("cboettig")
#' topic(8)
#'
#' library("httr")
#' latest_topics(config=verbose())
#'
#' # Create topic
#' ## simple
#' create_topic(title="testing from discgolf - 1", text="testing from discgolf, hello world! hopefully this works")
#'
#' ## more complicated
#' text <- '
#' ## this time with markdown
#'
#' ```r
#' print("hello world")
#' #> [1] "hello world"
#' ```
#'
#' ```r
#' head(mtcars)
#' #>                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#' #> Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#' #> Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#' #> Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#' #> Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#' #> Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#' #> Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
#' ```
#' '
#' create_topic(title="testing from discgolf - 2", text=text)
#' }

#' @export
#' @rdname topics
latest_topics <- function(url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, "latest.json", args, ...)
}

#' @export
#' @rdname topics
new_topics <- function(url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, "new.json", args, ...)
}

#' @export
#' @rdname topics
topics_by <- function(id, url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, sprintf("topics/created-by/%s.json", id), args, ...)
}

#' @export
#' @rdname topics
topic <- function(id, url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user)))
  disc_GET(url, sprintf("t/%s.json", id), args, ...)
}

#' @export
#' @rdname topics
create_topic <- function(title, text, category=NULL, url="http://discuss.ropensci.org", key=NULL, user=NULL, ...){
  args <- dc(list(api_key=check_key(key), api_username=check_user(user),
                  title=title, raw=text, category=category))
  disc_POST(url, endpt="posts", args, ...)
}
