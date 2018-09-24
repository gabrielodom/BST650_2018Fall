
######  Student's t-test  #####################################################

# Poisson random vector
xPois <- rpois(n = 15, lambda = 3)
hist(xPois)


# Create an Expirment List
xPois_ls <- list(
  dist = "Poisson",
  params = c(lambda = 3),
  sample = rpois(n = 15, lambda = 3)
)
hist(xPois_ls$sample)

# Find the Sample Mean and Variance
mean(xPois_ls$sample)
var(xPois_ls$sample)


# Hypothesis Test on Sample Mean
# H0: mu = 3
# HA: mu != 3

# Critical value
qt(0.975, 14)

# Test Statistic
t_mod <- t.test(
  xPois_ls$sample,
  alternative = "two.sided",
  mu = xPois_ls$params
)

class(t_mod)

### Checking CLasses ###
# Use the is.<CLASS>() function to test if an object has that class
is.list(t_mod) # t_mod is a list
is.matrix(t_mod)
is.list(xPois_ls$params)
is.numeric(xPois_ls$params)


# Subset the t.test
t_mod$statistic


# Make a decision
abs(t_mod$statistic) > qt(0.975, 14)
# So, we fail to reject the null hypothesis that the population mean equals 3.


######  Data Frames  ##########################################################

# Create a data frames of the people in the class
myClass <- data.frame(
  Surname = c("Odom", "Dyatchenko", "Ma", "Gmunder"),
  GivenName = c("Gabriel", "Nina", "Ruixuan (Mavis)", "Kristin"),
  CupsCoffeeTea = c(0, 3, 2, 0)
)

myClass
myClass[["neighbourhood"]] <- c("Pembroke Pines", "Miami Beach", "Beijing", "Brickell")

myClass
myClass$neighbourhood <- c("Pembroke Pines", "Miami Beach", "Beijing", "Brickell")

### Subset a Data Frame  ###
myClass$Surname
myClass[, 1]
myClass[["Surname"]]

myClass$Surname[2]
myClass[2, 1]
