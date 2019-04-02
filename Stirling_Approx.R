# Stirling's Approximation of the Factorial
# Gabriel Odom
# 2019-03-19

# Natural Log of n!
f1 <- function(n) sum(log(seq_len(n)))
f1(5)
f1(500)
f1(50000)
identical(lgamma(5 + 1), f1(5))
identical(lgamma(500 + 1), f1(500))


# Estimate of Natural Log of n!: Integral of log n from 1 to n
f2 <- function(n) n * log(n) - n + 1
f2(5)
f2(500)
f2(50000)


#  Error ratio
errorRat_f1f2 <- function(n) f1(n) / f2(n)
errorRat_f1f2(5)
errorRat_f1f2(500)
errorRat_f1f2(50000)

plot(1:100, sapply(1:100, errorRat_f1f2))


# Re-estimate of Natural Log of n!
f3 <- function(n) n * log(n) - n + 0.5 * log(2 * pi * n)
f3(5)
f3(500)
f3(50000)


#  Error ratio
errorRat_f1f3 <- function(n) f1(n) / f3(n)
errorRat_f1f3(5)
errorRat_f1f3(500)
errorRat_f1f3(50000)

plot(2:100, sapply(2:100, errorRat_f1f3))
