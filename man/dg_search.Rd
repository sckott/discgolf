% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search.R
\name{dg_search}
\alias{dg_search}
\title{Search}
\usage{
dg_search(
  query = NULL,
  order = NULL,
  status = NULL,
  category = NULL,
  username = NULL,
  group = NULL,
  badge = NULL,
  in_ = NULL,
  posts_count = NULL,
  min_age = NULL,
  max_age = NULL,
  page = 1,
  ...
)
}
\arguments{
\item{query}{(character) Query terms. Required.}

\item{order}{(character) One of views, latest, likes}

\item{status}{(character) One of open, closed, archived, noreplies,
or single_user}

\item{category}{(character) Category to search for}

\item{username}{(character) User name}

\item{group}{(character) Groupo name}

\item{badge}{(character) Badge name}

\item{in_}{(character) One of likes, posted, watching, tracking, private,
bookmarks, first}

\item{posts_count}{(integer) Number of posts per topic}

\item{min_age}{(integer) Minimum age}

\item{max_age}{(integer) Maximum age}

\item{page}{(integer) a page number for pagination. records per page
is fixed at 50 (that is: up to 50). default: 1}

\item{...}{Named parameters passed on to \code{\link[crul]{HttpClient}}}
}
\description{
Search
}
\details{
This uses the \verb{/search} API route

all parameters except \code{page} are combined into a single
API query parameter called \code{q}, separated with \code{+}. individual parameters
are collapsed with colons. So a function call like
\code{dg_search(query = "tags:r", page = 1)} will turn in to
\verb{/search?q=tags:r&page=1}

Parameters not defined here can still be passed to \code{query}, with a
pattern \code{a:b}, where \code{a} is the field to query on, and \code{b} is the
term passed to \code{a}. See example below for \code{tags}
}
\examples{
\dontrun{
dg_search(query = "tags:r", page = 1)
dg_search(query = "tags:r", page = 2)
dg_search(query = "tags:r", page = 3)
dg_search(query = "poo")
dg_search(posts_count = 2, status = "open")
dg_search(in_ = "posted")
dg_search(status = "open")
}
}
