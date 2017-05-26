README
================

``` r
library(jsonlite)
library(JSOmetaN)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Examples
--------

``` r
data1 <- fromJSON("https://api.github.com/users/hadley/repos")
data1 %>% fetch() 
```

    ## # A tibble: 69 x 5
    ##            Key Doc.count      Class Obj.len Is.terminal
    ##          <chr>     <dbl>      <chr>   <dbl>       <lgl>
    ##  1          id        30    integer       1        TRUE
    ##  2        name        30  character       1        TRUE
    ##  3   full_name        30  character       1        TRUE
    ##  4       owner        30 data.frame      17       FALSE
    ##  5     private        30    logical       1        TRUE
    ##  6    html_url        30  character       1        TRUE
    ##  7 description        27  character       1        TRUE
    ##  8        fork        30    logical       1        TRUE
    ##  9         url        30  character       1        TRUE
    ## 10   forks_url        30  character       1        TRUE
    ## # ... with 59 more rows

``` r
data1 %>% fetch() %>% dig("owner") %>% fetch()
```

    ## # A tibble: 69 x 5
    ##            Key Doc.count      Class Obj.len Is.terminal
    ##          <chr>     <dbl>      <chr>   <dbl>       <lgl>
    ##  1          id        30    integer       1        TRUE
    ##  2        name        30  character       1        TRUE
    ##  3   full_name        30  character       1        TRUE
    ##  4       owner        30 data.frame      17       FALSE
    ##  5     private        30    logical       1        TRUE
    ##  6    html_url        30  character       1        TRUE
    ##  7 description        27  character       1        TRUE
    ##  8        fork        30    logical       1        TRUE
    ##  9         url        30  character       1        TRUE
    ## 10   forks_url        30  character       1        TRUE
    ## # ... with 59 more rows
    ## # A tibble: 17 x 5
    ##                    Key Doc.count     Class Obj.len Is.terminal
    ##                  <chr>     <dbl>     <chr>   <dbl>       <lgl>
    ##  1               login        30 character       1        TRUE
    ##  2                  id        30   integer       1        TRUE
    ##  3          avatar_url        30 character       1        TRUE
    ##  4         gravatar_id        30 character       1        TRUE
    ##  5                 url        30 character       1        TRUE
    ##  6            html_url        30 character       1        TRUE
    ##  7       followers_url        30 character       1        TRUE
    ##  8       following_url        30 character       1        TRUE
    ##  9           gists_url        30 character       1        TRUE
    ## 10         starred_url        30 character       1        TRUE
    ## 11   subscriptions_url        30 character       1        TRUE
    ## 12   organizations_url        30 character       1        TRUE
    ## 13           repos_url        30 character       1        TRUE
    ## 14          events_url        30 character       1        TRUE
    ## 15 received_events_url        30 character       1        TRUE
    ## 16                type        30 character       1        TRUE
    ## 17          site_admin        30   logical       1        TRUE

``` r
citibike <- fromJSON("http://citibikenyc.com/stations/json")
citibike$stationBeanList %>% fetch()
```

    ## # A tibble: 18 x 5
    ##                      Key Doc.count     Class Obj.len Is.terminal
    ##                    <chr>     <dbl>     <chr>   <dbl>       <lgl>
    ##  1                    id       666   integer       1        TRUE
    ##  2           stationName       666 character       1        TRUE
    ##  3        availableDocks       666   integer       1        TRUE
    ##  4            totalDocks       666   integer       1        TRUE
    ##  5              latitude       666   numeric       1        TRUE
    ##  6             longitude       666   numeric       1        TRUE
    ##  7           statusValue       666 character       1        TRUE
    ##  8             statusKey       666   integer       1        TRUE
    ##  9        availableBikes       666   integer       1        TRUE
    ## 10            stAddress1       666 character       1        TRUE
    ## 11            stAddress2       666 character       1        TRUE
    ## 12                  city       666 character       1        TRUE
    ## 13            postalCode       666 character       1        TRUE
    ## 14              location       666 character       1        TRUE
    ## 15              altitude       666 character       1        TRUE
    ## 16           testStation       666   logical       1        TRUE
    ## 17 lastCommunicationTime       666 character       1        TRUE
    ## 18              landMark       666 character       1        TRUE

``` r
races <- fromJSON("http://ergast.com/api/f1/2012/1/results.json")
races$MRData$RaceTable$Races %>% fetch() %>% dig("Circuit") %>% fetch %>% dig("Location") %>% fetch()
```

    ## # A tibble: 8 x 5
    ##        Key Doc.count      Class Obj.len Is.terminal
    ##      <chr>     <dbl>      <chr>   <dbl>       <lgl>
    ## 1   season         1  character       1        TRUE
    ## 2    round         1  character       1        TRUE
    ## 3      url         1  character       1        TRUE
    ## 4 raceName         1  character       1        TRUE
    ## 5  Circuit         1 data.frame       4       FALSE
    ## 6     date         1  character       1        TRUE
    ## 7     time         1  character       1        TRUE
    ## 8  Results         1       list       1        TRUE
    ## # A tibble: 4 x 5
    ##           Key Doc.count      Class Obj.len Is.terminal
    ##         <chr>     <dbl>      <chr>   <dbl>       <lgl>
    ## 1   circuitId         1  character       1        TRUE
    ## 2         url         1  character       1        TRUE
    ## 3 circuitName         1  character       1        TRUE
    ## 4    Location         1 data.frame       4       FALSE
    ## # A tibble: 4 x 5
    ##        Key Doc.count     Class Obj.len Is.terminal
    ##      <chr>     <dbl>     <chr>   <dbl>       <lgl>
    ## 1      lat         1 character       1        TRUE
    ## 2     long         1 character       1        TRUE
    ## 3 locality         1 character       1        TRUE
    ## 4  country         1 character       1        TRUE
