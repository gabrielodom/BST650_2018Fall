# Anscombe Data
# Gabriel Odom
# 2018-12-14

library(tidyverse)
anscombe <- read_csv("data/anscombe.csv")

# Anscombe 1
a1_mod <- lm(y ~ x, data = anscombe %>% filter(set == "I"))
# Kristin: "III"
# Mavis: "IV"
# Nina: "II"

summary(a1_mod)


###  Assumption 1: Errors are Normally Distributed  ###
hist(a1_mod$residuals)
qqnorm(a1_mod$residuals)
qqline(a1_mod$residuals)


###  Assumption 2: Model Errors Have Mean 0  ###
t.test(a1_mod$residuals, alternative = "two.sided", mu = 0)


###  Assumption 3: Model Errors are Homoskedastic  ###
library(lmtest)
res <- bptest(a1_mod)
res

plot(a1_mod$residuals)


###  Assumption 4: Model Errors are Independent  ###
dwtest(a1_mod)
acf(a1_mod$residuals)


###  Assumption 0: The Linear Model is Appropriate  ###
anscombe %>% 
  filter(set == "I") %>% 
  ggplot() +
  aes(x = x, y = y) +
  geom_point() +
  geom_smooth(method = "lm")
