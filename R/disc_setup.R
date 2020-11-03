#' Discgolf setup
#'
#' @name disc_setup
#' @section How to setup:
#' You can set your url, username, and api key either using R options or
#' environment variables. I recommend using environment variables since
#' they are more general to any programming language, and you can easily
#' set secure env vars on a server or e.g., if you're doing continuous
#' integration on Travis-CI (or elsewhere).
#' 
#' You used to be able to pass user name and api key via function 
#' parameters, but that option has been removed to reduce likelihood of a
#' user accidentally including either of those in a public website.
#'
#' @section URL:
#' The base URL for the Discourse instance, e.g., `https://meta.discourse.org`
#'
#' Use one of:
#'
#' - Env var name: `DISCOURSE_URL`
#' - R option name: `discourse_url`
#'
#' @section Username:
#' The user name you have registered on the Discourse instance you want
#' to use.
#'
#' Use one of:
#' 
#' - Env var name: `DISCOURSE_USERNAME`
#' - R option name: `discourse_username`
#'
#' @section API key:
#' The API key on the Discourse instance you want to use. This is not your
#' password you used to login to the instance. If you're the admin, you can get
#' an API key by going the dashboard at `base_url/admin`, then the API tab
#' `base_url/admin/api`, then generate a key, or copy the one already there.
#'
#' Use one of:
#'
#' - Env var name: `DISCOURSE_API_KEY`
#' - R option name: `discourse_api_key`
#'
NULL
