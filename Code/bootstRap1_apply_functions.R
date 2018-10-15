# Bootsrapping in R
# Applying Functions
# Gabriel Odom
# 2018-10-08


######  Review: Create a Function  ############################################
myBoot <- function(x){
  sample(x, size = length(x), replace = TRUE)
}


######  The *apply() Family  ##################################################
# The *apply() functions take an object and "apply" a function to each element
#   of that object. In other languages, this would often be accomplished with a
#   for() loop, but R supports internal for() loop functionality for all vectors

###  For Simple Vectors  ###
grades <- c(92, 80, 85, 95, 97, 78, 90, 86, 88, 66, 70, 82)

sapply(1:2, function(i){
  mean(grades)
})

sapply(1:2, function(i){
  myBoot(grades)
})

sapply(1:10, function(i){
  myBoot(grades)
})

###  For Lists  ###
lapply(1:2, function(i){
  myBoot(grades)
})

myBootSamps_ls <- lapply(1:10000, function(i){
  myBoot(grades)
})

lapply(myBootSamps_ls[1:10], function(x){
  mean(x)
})

lapply(myBootSamps_ls, mean(x))

lapply(myBootSamps_ls, mean)

lapply(myBootSamps_ls, myBoot)

# Create a summary function
mySummary <- function(x){
  
  sixNumSummary <- summary(x)
  stdDev <- sd(x)
  out <- c(sixNumSummary, StdDev = stdDev)
  return(out)
  
}
# Test
mySummary(grades)

# Find my summary for all bootstrap samples
summary_mat <- sapply(myBootSamps_ls, mySummary)
rowMeans(summary_mat)


###  For Matrices (Advanced)  ###