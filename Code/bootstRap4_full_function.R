######  Introductory Notes  ###################################################
# It is possible to pass a function as an argument to another function. This is
#   because R is a *functional* language.

takeThe <- function(what, to){
  what(to)
}

# test
x <- rnorm(25)
takeThe(mean, x)
takeThe(sd, x)



######  The Bootstrap Function  ###############################################
# Input: data, statistic, n = NULL
# Output: value of the statistic
# Steps:
#  1. clean data
#  2. Check type of data (compare against n, take sample)
#  3. take sample of size n
#  4. call statistic on sample


BootThe <- function(data, statistic = mean, n = NULL, ...){
  
  if((is.matrix(data) == TRUE) || (is.data.frame(data) == TRUE)){
    # START: rectangular data
    
    data <- na.omit(data)
    
    if(is.null(n)){
      n <- nrow(data)
    }
    
    if(nrow(data) < n){
      stop("Re-sample size (n) must be less than or equal to N.")
    } else {
      
      samp_idx <- sample(x = nrow(data), size = n, replace = TRUE)
      bootData <- data[samp_idx, ]
      
    }
    # END: rectangular data
    
  } else if((is.atomic(data) == TRUE) || (is.list(data) == TRUE)){
    # START: vector-type set data
    
    data <- data[!is.na(data)]
    
    if(is.null(n)){
      n <- length(data)
    }
    
    if(length(data) < n){
      stop("Re-sample size (n) must be less than or equal to N.")
    } else {
      bootData <- sample(x = data, size = n, replace = TRUE)
    }
    # END: vector-type set data
    
  } else {
    stop("Data must be or extend classes 'list', 'atomic', 'matrix', or 'data.frame'.")
  }
  
  statistic(bootData, ...)  
  
}



######  Test the Function  ####################################################
wcgs_df <- read.csv("data/wcgs.csv", header = TRUE, stringsAsFactors = FALSE)

numericCols_char <- c("age", "chol", "dbp", "sbp", "height", "weight")
wcgsSubset_df <- wcgs_df[1:100, numericCols_char]

# One bootstrap estimate of the correlation matrix for the subset of the wcgs
#   data. See ?cor for details.
BootThe(wcgsSubset_df, statistic = cor)

# 10 bootstrap estimates of the above correlation matrix:
replicate(10, BootThe(wcgsSubset_df, statistic = cor), simplify = FALSE)
