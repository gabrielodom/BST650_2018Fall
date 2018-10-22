# Control Flow in R
# Gabriel Odom
# 2018-10-22


# t-test on 0-variance data
x <- rep(0, 30)

xTtest <- t.test(x, mu = 2)
xTtest$conf.int
failToReject <- xTtest$conf.int[1] < 0 && 0 < xTtest$conf.int[2]

# if failToReject is TRUE, then mu is in the CI
# if failToReject is FALSE, then mu is not in the CI
# if failToReject is NA, then mu is not in the CI (because the CI does not exist)

###  Write an if() Statement  ###
if(is.na(failToReject)){
  failToReject <- FALSE
}

# Lesson on control flow in R
# http://resbaz.github.io/2014-r-materials/lessons/30-control-flow/
# Lesson on functions and if/else
# http://r4ds.had.co.nz/functions.html
