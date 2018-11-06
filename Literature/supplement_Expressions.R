######  Advanced R Chapter 16: Expressions  ###################################

library(rlang)
devtools::install_github("r-lib/lobstr")
library(lobstr)

###  Intro  ###
expr(y <- x * 10)
x <- 4
eval(expr(y <- x * 10))
y


### Abstract Syntax Trees (ASTs)  ###
ast(f(x, "y", 1))
ast(f(g(1, 2), h(3, 4, i())))
ast(y <- x * 10)
ast(f((1)))
ast(`(`(1 + 1))


###  Symbols  ###
# Symbols are not vectorized--they always have length 1.

# This is a call:
ast(expr(read.table("blah.csv", row.names = FALSE)))
x <- expr(read.table("blah.csv", row.names = FALSE))
x
as.list(x)
# Notice that the first element of the call is a symbol
x[-1]
expr_text(x)


###  Grammar  ###
1 + 2 * 3
ast(1 + 2 * 3)

ast(!x %in% y)
ast((!x) %in% y)

# Parse an expression from a character string
x1 <- "y2 <- y + 10"
!!x1
parse_expr(x1)
eval(parse_expr(x1))
!!parse_expr(x1)
ast(!!parse_expr(x1))

# Parse multiple expressions from a character string
x2 <- "12 \n # This is a comment \n rnorm(1)"
parse_exprs(x2)

expr_text(x)

expr <- expr(g(a + b + c + d + e + f + g + h + i + j + k + l + m +
                 n + o + p + q + r + s + t + u + v + w + x + y + z))
deparse(expr)
expr_text(expr)


###  More Data Structures  ###
# Pairlists
f <- expr(function(x, y = 10) x + y)
f
as.list(f)
str(as.list(f))
otherStuff <- as.list(f)[[4]]
otherStuff
str(otherStuff)
class(otherStuff)
attributes(otherStuff)
attributes(otherStuff)$srcfile
str(attributes(otherStuff)$srcfile)
class(attributes(otherStuff)$srcfile)
mode(attributes(otherStuff)$srcfile)
ls(attributes(otherStuff)$srcfile)
attributes(otherStuff)$srcfile[["filename"]]
attributes(otherStuff)$srcfile[["fixedNewlines"]]
attributes(otherStuff)$srcfile[["lines"]]
