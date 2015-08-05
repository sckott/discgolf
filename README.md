discgolf
=======



[![Build Status](https://travis-ci.org/sckott/discgolf.svg)](https://travis-ci.org/sckott/discgolf)
[![codecov.io](https://codecov.io/github/sckott/discgolf/coverage.svg?branch=master)](https://codecov.io/github/sckott/discgolf?branch=master)

`discgolf` is an R client for the Discourse API, based off the Ruby gem [discourse_api](https://github.com/discourse/discourse_api)

## Installation


```r
install.packages("devtools")
devtools::install_github("sckott/discgolf")
```


```r
library("discgolf")
```

## Authentication

The Discourse API is based on using a specific installation of Discourse, which requires your username and an API key for that installation. Get those, and you can pass them in to each function call, or set as option variables in `.Rprofile` (use `discourse_api_key` and `discourse_username`) or environment variables in `.Renviron` (use `DISCOURSE_API_KEY` and `DISCOURSE_USERNAME`).

## Functions

Only functions for GETting topics are included as of 2014-12-18

Get latest topics


```r
latest_topics()
```


```
#>     id
#> 1    8
#> 2  180
#> 3  178
#> 4  179
#> 5  172
#> 6  137
#> 7  174
#> 8  170
#> 9  164
#> 10 171
#> 11 162
#> 12 143
#> 13 144
#> 14 160
#> 15 158
#> 16 157
#> 17  75
#> 18 159
#> 19 120
#> 20 134
#> 21 136
#> 22 128
#> 23 135
#> 24 133
#> 25 125
#> 26 112
#> 27 122
#> 28 113
#> 29  92
#> 30 110
#>                                                                                     title
#> 1                                                             Welcome to rOpenSci Discuss
#> 2                                                       Code review/onboarding milestones
#> 3                                                 R package authors: may I interview you?
#> 4                                                               Rplos: any features/bugs?
#> 5                                                 Water Resource API List and Development
#> 6                                                 Use of some ropensci packages on GitHub
#> 7                                      Rgbif: occ_count() and occ_search() results differ
#> 8                                         OAuth2.0 Testing: Would you like a web service?
#> 9                                                          Field data collection workflow
#> 10 (Generic function/package for) Mapping non-ascii characters to nearest ascii versions?
#> 11          Differences between rerddap and rnoaa and questions related to ERDDAP griddap
#> 12                                                            Google Drive/Docs Rmarkdown
#> 13                                             Directions for rchie package / Google Docs
#> 14                                                         Is Readme.io of any use to us?
#> 15                                                                RSS feeds for this site
#> 16                                         Test API-wrapping R packages with OAuth Tokens
#> 17                                                          Web Services: Packages Needed
#> 18                                               Anything you don't like about this site?
#> 19                                                  StackExchange Community Promotion Ads
#> 20                                                             ClinicalTrials.gov package
#> 21                       Help needed with docker for reproducible research paper in knitr
#> 22                              Is there a location for rOpensci programming conventions?
#> 23                                  Anyone having problems with rentrez's latest release?
#> 24                                                                   Screencasts test run
#> 25                                                            Publishing travis artefacts
#> 26                                                                      Neurobiology data
#> 27                                                     Recommendation mechanism to review
#> 28                                         Using rcrossref to generate set of sample DOIs
#> 29                                                         Feedback on geojsonio package?
#> 30                                                    Darwin Core Archive package - finch
#>                                                                               fancy_title
#> 1                                                             Welcome to rOpenSci Discuss
#> 2                                                       Code review/onboarding milestones
#> 3                                                 R package authors: may I interview you?
#> 4                                                               Rplos: any features/bugs?
#> 5                                                 Water Resource API List and Development
#> 6                                                 Use of some ropensci packages on GitHub
#> 7                                      Rgbif: occ_count() and occ_search() results differ
#> 8                                         OAuth2.0 Testing: Would you like a web service?
#> 9                                                          Field data collection workflow
#> 10 (Generic function/package for) Mapping non-ascii characters to nearest ascii versions?
#> 11          Differences between rerddap and rnoaa and questions related to ERDDAP griddap
#> 12                                                            Google Drive/Docs Rmarkdown
#> 13                                             Directions for rchie package / Google Docs
#> 14                                                         Is Readme.io of any use to us?
#> 15                                                                RSS feeds for this site
#> 16                                         Test API-wrapping R packages with OAuth Tokens
#> 17                                                          Web Services: Packages Needed
#> 18                                         Anything you don&rsquo;t like about this site?
#> 19                                                  StackExchange Community Promotion Ads
#> 20                                                             ClinicalTrials.gov package
#> 21                       Help needed with docker for reproducible research paper in knitr
#> 22                              Is there a location for rOpensci programming conventions?
#> 23                            Anyone having problems with rentrez&rsquo;s latest release?
#> 24                                                                   Screencasts test run
#> 25                                                            Publishing travis artefacts
#> 26                                                                      Neurobiology data
#> 27                                                     Recommendation mechanism to review
#> 28                                         Using rcrossref to generate set of sample DOIs
#> 29                                                         Feedback on geojsonio package?
#> 30                                                    Darwin Core Archive package - finch
#>                                                                                   slug
#> 1                                                          welcome-to-ropensci-discuss
#> 2                                                    code-review-onboarding-milestones
#> 3                                                r-package-authors-may-i-interview-you
#> 4                                                              rplos-any-features-bugs
#> 5                                              water-resource-api-list-and-development
#> 6                                              use-of-some-ropensci-packages-on-github
#> 7                                        rgbif-occ-count-and-occ-search-results-differ
#> 8                                        oauth2-0-testing-would-you-like-a-web-service
#> 9                                                       field-data-collection-workflow
#> 10 generic-function-package-for-mapping-non-ascii-characters-to-nearest-ascii-versions
#> 11       differences-between-rerddap-and-rnoaa-and-questions-related-to-erddap-griddap
#> 12                                                         google-drive-docs-rmarkdown
#> 13                                            directions-for-rchie-package-google-docs
#> 14                                                       is-readme-io-of-any-use-to-us
#> 15                                                             rss-feeds-for-this-site
#> 16                                      test-api-wrapping-r-packages-with-oauth-tokens
#> 17                                                        web-services-packages-needed
#> 18                                              anything-you-dont-like-about-this-site
#> 19                                               stackexchange-community-promotion-ads
#> 20                                                          clinicaltrials-gov-package
#> 21                    help-needed-with-docker-for-reproducible-research-paper-in-knitr
#> 22                            is-there-a-location-for-ropensci-programming-conventions
#> 23                                 anyone-having-problems-with-rentrezs-latest-release
#> 24                                                                screencasts-test-run
#> 25                                                         publishing-travis-artefacts
#> 26                                                                   neurobiology-data
#> 27                                                  recommendation-mechanism-to-review
#> 28                                      using-rcrossref-to-generate-set-of-sample-dois
#> 29                                                       feedback-on-geojsonio-package
#> 30                                                   darwin-core-archive-package-finch
#>    posts_count
#> 1            3
#> 2            3
#> 3            6
#> 4            1
#> 5            6
#> 6            4
#> 7           13
#> 8            4
#> 9            4
#> 10          10
#> 11          12
#> 12          12
#> 13          10
#> 14          10
#> 15           2
#> 16          11
#> 17           5
#> 18           4
#> 19          15
#> 20           6
#> 21           5
#> 22           8
#> 23           4
#> 24           3
#> 25           7
#> 26          10
#> 27           2
#> 28          12
#> 29          10
#> 30           1
```

Get new topics


```r
new_topics()
#> $topic_list
#> $topic_list$can_create_topic
#> [1] TRUE
#> 
#> $topic_list$draft
#> NULL
#> 
#> $topic_list$draft_key
#> [1] "new_topic"
#> 
#> $topic_list$draft_sequence
#> [1] 23
#> 
#> $topic_list$per_page
#> [1] 30
#> 
#> $topic_list$topics
#> list()
```

Get topics by a specific user


```r
topics_by("cboettig")
#> $users
#>   id    username uploaded_avatar_id
#> 1  3    cboettig                  4
#> 2  2     karthik                  3
#> 3 35    noamross                 57
#> 4  1      sckott                  2
#> 5 15 thosjleeper                 22
#>                                               avatar_template
#> 1     /user_avatar/discuss.ropensci.org/cboettig/{size}/4.png
#> 2      /user_avatar/discuss.ropensci.org/karthik/{size}/3.png
#> 3    /user_avatar/discuss.ropensci.org/noamross/{size}/57.png
#> 4       /user_avatar/discuss.ropensci.org/sckott/{size}/2.png
#> 5 /user_avatar/discuss.ropensci.org/thosjleeper/{size}/22.png
#> 
#> $topic_list
#> $topic_list$can_create_topic
#> [1] TRUE
#> 
#> $topic_list$draft
#> NULL
#> 
#> $topic_list$draft_key
#> [1] "new_topic"
#> 
#> $topic_list$draft_sequence
#> [1] 23
#> 
#> $topic_list$per_page
#> [1] 30
#> 
#> $topic_list$topics
#>    id
#> 1 171
#> 2  15
#> 3  16
#>                                                                                    title
#> 1 (Generic function/package for) Mapping non-ascii characters to nearest ascii versions?
#> 2                                             Using Discourse for blog comments as well?
#> 3                                                                        Reply by email?
#>                                                                              fancy_title
#> 1 (Generic function/package for) Mapping non-ascii characters to nearest ascii versions?
#> 2                                             Using Discourse for blog comments as well?
#> 3                                                                        Reply by email?
#>                                                                                  slug
#> 1 generic-function-package-for-mapping-non-ascii-characters-to-nearest-ascii-versions
#> 2                                           using-discourse-for-blog-comments-as-well
#> 3                                                                      reply-by-email
#>   posts_count reply_count highest_post_number image_url
#> 1          10           4                  10        NA
#> 2           8           4                   8        NA
#> 3           6           2                   6        NA
#>                 created_at           last_posted_at bumped
#> 1 2015-04-02T21:03:12.136Z 2015-04-03T12:07:21.599Z   TRUE
#> 2 2014-12-15T19:33:11.879Z 2015-01-02T19:47:42.403Z   TRUE
#> 3 2014-12-15T20:10:36.414Z 2014-12-17T00:18:31.427Z   TRUE
#>                  bumped_at unseen last_read_post_number unread new_posts
#> 1 2015-04-04T11:29:33.807Z  FALSE                    10      0         0
#> 2 2015-01-02T19:47:42.403Z  FALSE                     8      0         0
#> 3 2014-12-17T00:18:31.427Z  FALSE                     6      0         0
#>   pinned unpinned visible closed archived notification_level bookmarked
#> 1  FALSE       NA    TRUE  FALSE    FALSE                  2      FALSE
#> 2  FALSE       NA    TRUE  FALSE    FALSE                  2       TRUE
#> 3  FALSE       NA    TRUE  FALSE    FALSE                  3       TRUE
#>   liked views like_count has_summary archetype last_poster_username
#> 1  TRUE    78          1       FALSE   regular          thosjleeper
#> 2 FALSE   261          0       FALSE   regular             cboettig
#> 3 FALSE   132          0       FALSE   regular               sckott
#>   category_id pinned_globally
#> 1           7           FALSE
#> 2           3           FALSE
#> 3           1           FALSE
#>                                                                                                                           posters
#> 1 NA, NA, NA, NA, latest, Original Poster, Frequent Poster, Frequent Poster, Frequent Poster, Most Recent Poster, 3, 2, 35, 1, 15
#> 2         latest, NA, NA, NA, Original Poster, Most Recent Poster, Frequent Poster, Frequent Poster, Frequent Poster, 3, 2, 35, 1
#> 3                                                                           NA, latest, Original Poster, Most Recent Poster, 3, 1
#>   bookmarked_post_numbers
#> 1                    NULL
#> 2                       1
#> 3                       1
```

Get a single topic by id number


```r
topic(8)
```


```
#>   id              name username
#> 1 11            system   system
#> 2 14 Scott Chamberlain   sckott
#> 3 51 Scott Chamberlain   sckott
#>                                         avatar_template uploaded_avatar_id
#> 1 /user_avatar/discuss.ropensci.org/system/{size}/1.png                  1
#> 2 /user_avatar/discuss.ropensci.org/sckott/{size}/2.png                  2
#> 3 /user_avatar/discuss.ropensci.org/sckott/{size}/2.png                  2
```
