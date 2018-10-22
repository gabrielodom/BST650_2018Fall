
CheckCoverage <- function(x, n, alpha = 0.05){
  
  # Step 0: Clean the Data
  x <- x[!is.na(x)] # Remove missing values
  
  # Step 1: The "Truth" (null hypothesis)
  xMu <- mean(x, na.rm = TRUE) # "true" mean
  
  # Step 2: randomly select n values
  sampX <- sample(x, size = n, replace = FALSE)
  
  # Step 3: Construct a 95% CI
  t_mod <- t.test(
    x = sampX,
    mu = xMu,
    alternative = "two.sided",
    conf.level = 1 - alpha
  )
  
  # Step 4: Test if the population mean is contained in the CI
  CI <- t_mod$conf.int
  failToReject <- (CI[1] < xMu) && (xMu < CI[2])
  if(is.na(failToReject)){
    failToReject <- FALSE
  }
  
  failToReject
  
}
