discgolf
=======



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
#>    id
#> 1   8
#> 2   7
#> 3  16
#> 4  21
#> 5  20
#> 6  19
#> 7  15
#> 8   9
#> 9   6
#> 10  5
#> 11  4
#>                                                                                title
#> 1                                                        Welcome to rOpenSci Discuss
#> 2                                                         Assets for the site design
#> 3                                                                    Reply by email?
#> 4  Just rebuilt app, testing to see if domain name is used now instead of IP address
#> 5                                                                Discuss Categories?
#> 6                                        Testing to see if emails are sent correctly
#> 7                                         Using Discourse for blog comments as well?
#> 8                                                              Welcome to the Lounge
#> 9                                                                     Privacy Policy
#> 10                                                                    FAQ/Guidelines
#> 11                                                                  Terms of Service
#>                                                                          fancy_title
#> 1                                                        Welcome to rOpenSci Discuss
#> 2                                                         Assets for the site design
#> 3                                                                    Reply by email?
#> 4  Just rebuilt app, testing to see if domain name is used now instead of IP address
#> 5                                                                Discuss Categories?
#> 6                                        Testing to see if emails are sent correctly
#> 7                                         Using Discourse for blog comments as well?
#> 8                                                              Welcome to the Lounge
#> 9                                                                     Privacy Policy
#> 10                                                                    FAQ/Guidelines
#> 11                                                                  Terms of Service
#>                                                                                slug
#> 1                                                       welcome-to-ropensci-discuss
#> 2                                                        assets-for-the-site-design
#> 3                                                                    reply-by-email
#> 4  just-rebuilt-app-testing-to-see-if-domain-name-is-used-now-instead-of-ip-address
#> 5                                                                discuss-categories
#> 6                                       testing-to-see-if-emails-are-sent-correctly
#> 7                                         using-discourse-for-blog-comments-as-well
#> 8                                                             welcome-to-the-lounge
#> 9                                                                    privacy-policy
#> 10                                                                   faq-guidelines
#> 11                                                                 terms-of-service
#>    posts_count
#> 1            2
#> 2            3
#> 3            6
#> 4            3
#> 5            1
#> 6            3
#> 7            3
#> 8            1
#> 9            2
#> 10           2
#> 11           2
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
#> [1] 5
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
#>   id username uploaded_avatar_id
#> 1  3 cboettig                  4
#> 2  1   sckott                  2
#> 3  2  karthik                  3
#>                                           avatar_template
#> 1 /user_avatar/discuss.ropensci.org/cboettig/{size}/4.png
#> 2   /user_avatar/discuss.ropensci.org/sckott/{size}/2.png
#> 3  /user_avatar/discuss.ropensci.org/karthik/{size}/3.png
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
#> [1] 5
#> 
#> $topic_list$per_page
#> [1] 30
#> 
#> $topic_list$topics
#>   id                                      title
#> 1 16                            Reply by email?
#> 2 15 Using Discourse for blog comments as well?
#>                                  fancy_title
#> 1                            Reply by email?
#> 2 Using Discourse for blog comments as well?
#>                                        slug posts_count reply_count
#> 1                            reply-by-email           6           2
#> 2 using-discourse-for-blog-comments-as-well           3           0
#>   highest_post_number image_url               created_at
#> 1                   6        NA 2014-12-15T20:10:36.414Z
#> 2                   3        NA 2014-12-15T19:33:11.879Z
#>             last_posted_at bumped                bumped_at unseen
#> 1 2014-12-17T00:18:31.427Z   TRUE 2014-12-17T00:18:31.427Z  FALSE
#> 2 2014-12-15T19:50:06.904Z   TRUE 2014-12-15T19:50:06.904Z  FALSE
#>   last_read_post_number unread new_posts pinned unpinned visible closed
#> 1                     6      0         0  FALSE       NA    TRUE  FALSE
#> 2                     3      0         0  FALSE       NA    TRUE  FALSE
#>   archived notification_level views like_count starred has_summary
#> 1    FALSE                  3     7          0    TRUE       FALSE
#> 2    FALSE                  2     6          0   FALSE       FALSE
#>   archetype last_poster_username category_id
#> 1   regular               sckott           1
#> 2   regular               sckott           3
#>                                                                         posters
#> 1                         NA, latest, Original Poster, Most Recent Poster, 3, 1
#> 2 NA, NA, latest, Original Poster, Frequent Poster, Most Recent Poster, 3, 2, 1
```

Get a single topic by id number


```r
topic(8)
```


```
#>   id              name username
#> 1 11            system   system
#> 2 14 Scott Chamberlain   sckott
#>                                         avatar_template uploaded_avatar_id
#> 1 /user_avatar/discuss.ropensci.org/system/{size}/1.png                  1
#> 2 /user_avatar/discuss.ropensci.org/sckott/{size}/2.png                  2
```
