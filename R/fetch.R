#' Print a high-level summary of a data frame from JSON data
#'
#' @param jsondata \code{data.frame} Data frame output from reading a JSON array data into R using \code{\link[jsonlite]{jsonlite::fromJSON}}
#'
#' @examples
#' jsondata <- fromJSON("https://api.github.com/users/hadley/repos")
#' jsondata %>% fetch
#'
#' @importFrom tibble tibble
#' @export
fetch <- function(jsondata){
  # number of documents
  R <- nrow(jsondata)
  # number of 1st degree keys
  J <- ncol(jsondata)

	dummy.json <- matrix(0,R,J)
	docs.class <- rep(NA, J)
	all.docs.size <- matrix(0,R,J)
	for (j in 1:J){
	  docs.class[j] <- class(jsondata[,j])
		# nested apply functions (ugh) below might also work
		for (i in 1:R){
			if (length(jsondata[i,j])==1){dummy.json[i,j] <- is.na(jsondata[i,j])}
			all.docs.size[i,j] <- length(jsondata[i,j])
		}
	}

	docs.per.key <- R - colSums(dummy.json)
	docs.size <- apply(all.docs.size,2,max)
	
	fetched <- tibble(Key = colnames(jsondata) , Doc.count = docs.per.key,
	                  Class = docs.class, Obj.len = docs.size, Is.terminal = docs.size == 1)
	attr(fetched,"my_keyname") <- attr(jsondata,"my_keyname")

	# add type of each key, total depth
	print(fetched)
	print(paste("Parent node:",attr(fetched, "my_keyname")))

	# vector to pass to summary.key
	invisible(jsondata)
}






