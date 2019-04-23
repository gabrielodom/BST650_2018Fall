
######  Plot the PDF  ######
x <- seq(-10, 10, length.out = 1001)

t_test1 <- function(x, nu){
  
  const <- (1 / (sqrt(nu * pi))) * ((gamma((nu + 1) / 2)) / gamma(nu / 2)) 
  const * (x ^ 2 / nu + 1) ^ (-(nu + 1) / 2)
  
}

plot(x = x, y = t_test1(x, nu = 5), type = "l")


######  Random Sample Density  ######
t_samp <- rt(100000, df = 5)
plot(
  density(t_samp)
)


######  Overlay Density by DF  ######
tSamps_ls <- lapply(
  c(2, 3, 5, 10, 15, 20, 30, 200),
  function(DF){
    rt(100000, df = DF)
  }
)

plot(
  density(tSamps_ls[[1]]),
  xlim = c(-15, 15)
)
for (idx in 2:length(tSamps_ls)) {
  lines(
    density(tSamps_ls[[idx]]),
    col = idx
  )
}
