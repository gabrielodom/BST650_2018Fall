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



######  Repeat with CheckCoverage() Function  #################################
CheckCoverage(x = wcgs_df$BMI, n = 10)

# Repeat 10k times
covered_logi <- replicate(10000, CheckCoverage(x = wcgs_df$BMI, n = 10))
# Number of times we failed to reject (correct outcome):
sum(covered_logi)
# Number of times we rejected (incorrect outome):
sum(!covered_logi)
# Coverage probability:
mean(covered_logi)

# Change alpha = 0.2
covered_logi <- replicate(
  10000,
  CheckCoverage(x = wcgs_df$BMI, n = 10, alpha = 0.2)
)
mean(covered_logi)

# Change n = 100
covered_logi <- replicate(
  10000,
  CheckCoverage(x = wcgs_df$BMI, n = 100)
)
mean(covered_logi)


######  arcus  ################################################################
hist(wcgs_df$arcus)
mean(
  replicate(
    100000,
    CheckCoverage(x = wcgs_df$arcus, n = 10)
  ),
  na.rm = TRUE
)
# 99% for n = 10, 95.3% for n = 30, 94.9% for n = 50



######  height  ###############################################################
hist(wcgs_df$height)
mean(
  replicate(
    100000,
    CheckCoverage(x = wcgs_df$height, n = 10)
  ),
  na.rm = TRUE
)
# 95.0% for n = 10, 95% for n = 30, 95.2% for n = 50



######  ncigs  ################################################################
hist(wcgs_df$ncigs)
mean(
  replicate(
    100000,
    CheckCoverage(x = wcgs_df$ncigs, n = 50)
  ),
  na.rm = TRUE
)
# 93.1% for n = 10, 94.3% for n = 30, 94.6% for n = 50