#' Dig into a JSON data frame.
#'
#' @param jsondata \code{data.frame} Data frame output from reading a JSON array data into R using \code{\link[jsonlite]{jsonlite::fromJSON}}.
#' @param keyname \code{character} A key name to dig into \code{jsondata}.
#' @param rs \code{logical} Short for return summary. Should \code{dig} return the data or a summary of the data?
#'
#' @examples
#' library(jsonlite)
#' library(dplyr)
#' jsondata <- fromJSON("https://api.github.com/users/hadley/repos", flatten = FALSE)
#' jsondata %>% dig("owner") %>% dig("type")
#' jsondata %>% dig("owner", rs= T)
#' jsondata %>% dig("owner") %>% fetch()
#' @export
dig <- function(jsondata, keyname, rs = FALSE){
  if (!(keyname %in% names(jsondata))){
    stop("Error: Provided key name is not a key in the current level. Keep digging!")
  }
  dug <- jsondata[,keyname]
  attr(dug,"my_keyname") <- keyname
  if(rs){
    summary(dug)
  } else{
    dug
  }
}
