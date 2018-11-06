library(rlang)
library(tidyverse)

######  Tidy Evaluation Introduction  #########################################
###  What is Tidy Eval?  ###
transmute(starwars, height / mass)
height / mass
starwars$height / starwars$mass
quote(height / mass)
"height / mass"
x <- quote(height / mass)
x
eval(x)
eval(x, starwars)
?eval


###  Why Tidy Eval?  ###
cement <- function(...){
  
  vars <- ensyms(...)
  vars <- map(vars, as.character)
  paste(vars, collapse = " ")
  
}

paste("gabriel", "odom")
cement(gabriel, odom)

mouse3 <- "fievel"
cement(gabriel, odom, mouse3)
paste("gabriel", mouse3)
# This is a problem. We want the name contained in the object mouse3, not the
#   name of the object. We need a way to tell the function to evaluate one of
#   the objects (mouse3), while quoting the others ("gabriel" and "odom"). We
#   use the `!!`() function to make sure that the object name is evaluated 
#   rather than quoted.
cement(gabriel, odom, !!mouse3)

qq_show(
  cement(gabriel, odom, !!mouse3)
)
# The qq_show() shows which components have been "quasi-quoted".

# Overall, we can use tidy evaluation to introduce variability to quoted objects



######  Example 1  ############################################################
starwars %>% 
  summarise(avg = mean(height, na.rm = TRUE))

cols <- c("height", "mass")
starwars %>% 
  summarise(avg = mean(!!cols[1], na.rm = TRUE))
# ERROR

# What happened?
qq_show(
  starwars %>% 
    summarise(avg = mean(!!cols[1], na.rm = TRUE))
)
# We can't take the mean of a string--we need a symbol
"string"
string
sym("string")

# We need a function to turn a string into a symbol
colSym <- sym(cols[1])
colSym
# This only works for one string at a time, not an atomic vector of strings. We
#   use the syms() function instead
colsSym <- syms(cols)
colsSym

# Now what happens?
qq_show(
  starwars %>% 
    summarise(avg = mean(!!colSym, na.rm = TRUE))
)
# The output from qq_show() should match exactly what we would type by hand

# Now, apply it
lapply(colsSym, function(Name){
  starwars %>% 
    summarise(avg = mean(!!Name, na.rm = TRUE))
})

# let's create a function to apply
summariseWrap <- function(df, colName_char, method = mean, ...){
  
  colName_sym <- sym(colName_char)
  df %>% 
    summarise(avg = method(!!colName_sym, ...))
  
}

# Test it
summariseWrap(
  df = starwars,
  colName_char = cols[1],
  na.rm = TRUE
)
lapply(cols, summariseWrap, df = starwars, na.rm = TRUE)

# Add the function to a pipeline
starwars %>% 
  group_by(species) %>% 
  summariseWrap("height", method = mean, na.rm = TRUE)
# This function takes in a column name as a character string, which doesn't
#   match the other functions in the pipeline.



######  Your First Tidy Eval Function  ########################################
summariseWrap_ <- function(df, colName, method = mean, ...){
  
  colName_quo <- enquo(colName)
  df %>% 
    summarise(avg = method(!!colName_quo, ...))
  
}
# enquo() captures whatever the user supplies, and turns it into a quoted 
#   expression

# Test
starwars %>% 
  group_by(species) %>% 
  summariseWrap_(height, method = mean, na.rm = TRUE)
# We have our very own tidy eval function

lapply(colsSym, summariseWrap_, df = starwars, na.rm = TRUE)


###  A Note on Quosures  ###
# quo() works dynamically, while enquo() works programmatically to capture the
#   arguments of a function. quo() and enquo() both return a quosure: a language
#   object with an attribute showing in which environment that the language
#   should be evaluated.


quo(height / mass)

mice <- c("bernard", "bianca", "fievel")
makeMouse <- function(){
  
  mouse <- sample(mice, 1)
  quo(mouse)
  
}

makeMouse()
quo1 <- makeMouse()
quo1
pryr::object_size(quo1)
eval_tidy(quo1)
pryr::object_size("bernard")

quo2 <- makeMouse()
pryr::object_size(quo2)
eval_tidy(quo2)
pryr::object_size("fievel")
# As we can see, the quosure takes up more space because it saves the environment
#   of the function makeMouse() at the time it was called.

quo3 <- quo(list(!!quo1, !!quo2))
quo3
eval_tidy(quo3)
# To clean up all the quosures in an expression
quo_squash(quo3) # this strips the environment from the quosure, rendering it
# inexecutable



######  Tidy Eval with Variable Number of Arguments  ##########################
# We want a function to partition a data frame into two sets of columns
starwars %>% 
  select(name:mass, films)
starwars %>% 
  select(-(name:mass), -films)

partition <- function(df, ...){
  
  list(
    select(.data = df, ...),
    NULL
  )
  
}

# Test
starwars %>% 
  partition(name:mass)
# This works, but we can't do "-...", so we need to capture the dots


dots <- quos(name:mass, films)
qq_show(
  select(starwars, !!dots)
)
# The `!!`() function wont work. We need to splice a list and unquote each
#   element. Thats where the triple bang comes in
qq_show(
  select(starwars, !!!dots)
)
select(starwars, !!!dots)

# Here's the first update
partition <- function(df, ...){
  
  dots <- enquos(...)
  
  list(
    select(.data = df, !!!dots),
    NULL
  )
  
}

# Test
starwars %>% 
  partition(name:mass)

# Now we need to negate the dots
quo4 <- quo(-!!dots[[1]])
quo_squash(quo4)
qq_show(
  select(starwars, -!!dots[[1]])
)
lapply(dots, function(x) quo(-!!x))


# Here's the second update
partition <- function(df, ...){
  
  dots <- enquos(...)
  negDots <- lapply(dots, function(x) quo(-!!x))
  
  list(
    select(.data = df, !!!dots),
    select(.data = df, !!!negDots)
  )
  
}

# Test
starwars %>% 
  partition(name:mass)



######  Advanced Unquoting with `!!`  #########################################
prodHeight <- function(df, amt){
  transmute(df, height * amt)
}
prodHeight(starwars, 10)

# What if we had a column in df named amt? The amt column would mask the amt
#   argument. For example
starwars %>% 
  mutate(amt = 0) %>% 
  prodHeight(0.394)
# Instead of multiplying the height be the value amt = 10, it multiplies by the
#   value of 0 stored in the column named amt.

# We can use the `!!`() operator to fix this:
prodHeight <- function(df, amt){
  transmute(df, height * !!amt)
}
starwars %>% 
  mutate(amt = 0) %>% 
  prodHeight(0.394)
