######  Advanced R Chapter 6: Environments  ###################################
library(rlang)

e1 <- env(
  a = FALSE,
  b = "a",
  c = 2.3,
  d = 1:3
)

# An environment can contain itself
e1$e <- e1

e1
env_print(e1) # need the most recent version of rlang:: for this function
env_parents(e1)
env_parent(global_env())
env_parent(env_parent(global_env()))
env_parent(env_parent(env_parent(global_env())))
# Each call to env_parent() peels off another layer of parent environments. To
#   show the entire family tree, use env_parents()
env_parents(global_env())
# This is quite similar to the search path:
search_envs() # or base::search()

env_parent(R_GlobalEnv)
env_parent(Rf_GlobalEnv)
env_parent(.GlobalEnv)

# subset an environment via names only, as numeric indices don't make sense
e1$a
e1[["a"]]

# setting an environment binding to NULL does not remove it (unlike a list). 
#   Use rm() to remove a binding. Then garbage collection will delete the 
#   unbound object
e1$e <- NULL
env_print(e1)
rm(e, envir = e1) # or env_unbind(e1, "e")
env_print(e1)


###  Promises  ###
# Use base::delayedAssign() or rlang::env_bind_lazy()
?env_bind_lazy
env_bind_lazy(e1, name = { cat("forced!\n"); "value" })
env_print(e1)
pryr::object_size(e1)
e1$name
pryr::object_size(e1)

env_bind_lazy(e1, bigData = { read.csv("data/wcgs.csv") })
env_print(e1)
pryr::object_size(e1)
e1$bigData
pryr::object_size(e1)
env_unbind(e1, "bigData")
pryr::object_size(e1)


###  Active Bindings  ###
# Active bindings do something each time they are called:
env_bind_active(e1, z1 = function(val) runif(1))
env_print(e1)
e1$z1
e1$z1
# I could use this type of behaviour to "lock" a variable once it has been
#   created. This might be useful if I want to prohibit a user from changing a
#   value in my global environment


###  Functions  ###
# When a function is called, R creates a new sandbox environment as a child of
#   the most recently-inhabited environment. If the function was called directly
#   by the user, then this parent environment is often the global environment.
# In R, this child environment is created at the time of the function call, and
#   contains all of the arguments to the function. Because this function "wraps"
#   the function call with its arguments (and encloses a snapshot of the
#   environment from which it was called), functions in R are called "closures".
# For packages, the package environment controls how the user finds functions
#   within that package. However, the function itself needs an environment to
#   know how to find its internal arguments. This environment is called the 
#   namespace.