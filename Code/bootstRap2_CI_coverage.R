# Coverage of Confidence Intervals using WCGS data
# Gabriel Odom
# 2018-10-15

# Read the data
wcgs_df <- read.csv("data/wcgs.csv", header = TRUE, stringsAsFactors = FALSE)
head(wcgs_df)

######  Descriptive Statistics  ###############################################
summary(wcgs_df)

# Add a BMI column
wcgs_df$BMI <- (wcgs_df$weight * 703) / (wcgs_df$height ^ 2)

# True mean BMI
mean(wcgs_df$BMI) # 24.52


######  10,000 Random Samples of Size 10  #####################################
experimentN10_logi <- sapply(1:10000, function(i){
  
  # Step 0: Clean the Data
  x <- wcgs_df$BMI
  x <- x[!is.na(x)] # Remove missing values
  
  # Step 1: The "Truth" (null hypothesis)
  xMu <- mean(x, na.rm = TRUE) # "true" mean
  
  # Step 2: randomly select 10 BMIs
  sampBMI <- sample(x, size = 10, replace = FALSE)
  
  # Step 3: Construct a 95% CI
  t_mod <- t.test(
    x = sampBMI,
    mu = xMu,
    alternative = "two.sided",
    conf.level = 0.95
  )
  
  # Step 4: Test if 24.52 (the population mean) is contained in the CI
  CI <- t_mod$conf.int
  (CI[1] < xMu) && (xMu < CI[2])
  
})

mean(experimentN10_logi, na.rm = TRUE)
# We want this number to be as close to 0.95 as possible, without going under.
#   A few of the t-test confidence intervals fail, so we remove them with the
#   option na.rm = TRUE.
