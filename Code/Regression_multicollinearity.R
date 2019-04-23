# Multicollinearity
# Gabriel Odom
# 20181203

library(tidyverse)
wcgs_df <- read_csv("data/wcgs.csv")


######  Original Model  #######################################################
X_mat <- wcgs_df %>% 
  select(age, weight, sbp) %>% 
  as.matrix

XT <- t(X_mat)
XTX <- XT %*% X_mat
inv_XTX <- solve(XTX)
inv_XTX

# Check the inverse
inv_XTX %*% XTX
XTX %*% inv_XTX
# off at 10^-14



######  Add a Moderately-correlated Predictor  ################################
# Sbp and Dbp might be correlated
cor(wcgs_df$sbp, wcgs_df$dbp)
# rho = 0.77

X_mat <- wcgs_df %>% 
  select(age, weight, sbp, dbp) %>% 
  as.matrix

XT <- t(X_mat)
XTX <- XT %*% X_mat
inv_XTX <- solve(XTX)
inv_XTX

# Check the inverse
inv_XTX %*% XTX
XTX %*% inv_XTX
# off at 10^-13



######  Add a Strongly-correlated Predictor  ##################################
# We need to make a strongly correlated predictor
cor(wcgs_df$sbp, wcgs_df$sbp * wcgs_df$dbp)
# correlation between sbp and its interaction is 0.94

X_mat <- wcgs_df %>% 
  select(age, weight, sbp, dbp) %>% 
  as.matrix
X_mat[, 4] <- X_mat[, "sbp"] * X_mat[, "dbp"]
colnames(X_mat)[4] <- "sbp x dbp"
colnames(X_mat)

XT <- t(X_mat)
XTX <- XT %*% X_mat
inv_XTX <- solve(XTX)
inv_XTX

# Check the inverse
inv_XTX %*% XTX
XTX %*% inv_XTX
# off at 10^-11


######  Add a More Strongly-correlated Predictor  #############################
# We need to make a strongly correlated predictor
badX <- wcgs_df$sbp + rnorm(n = length(wcgs_df$sbp), mean = 0, sd = 1)
cor(wcgs_df$sbp, badX)

X_mat <- wcgs_df %>% 
  select(age, weight, sbp) %>% 
  as.matrix
X_mat <- cbind(X_mat, badX)

XT <- t(X_mat)
XTX <- XT %*% X_mat
inv_XTX <- solve(XTX)
inv_XTX

# Check the inverse
inv_XTX %*% XTX
XTX %*% inv_XTX
# off at 10^-11


chol_mod <- lm(chol ~ age + weight + sbp, data = wcgs_df)
X_df <- data.frame(
  chol = wcgs_df$chol,
  X_mat
)
cholBad_mod <- lm(chol ~ age + weight + sbp + badX, data = X_df)

# Compare
summary(chol_mod)
summary(cholBad_mod)
