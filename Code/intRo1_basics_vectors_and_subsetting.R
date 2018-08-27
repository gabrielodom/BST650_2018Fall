# Intro to R
# Lesson 1: Vectors and Arithmetic
# Dr. Gabriel Odom
# 2018-08-22

# This work is based on Prof. Evans "R Programming" notes.



######  Basics  ###############################################################
# Before we dive in, you can access help for most R commands via the ? symbol.
#   Further note that R is cAsE sEnSiTiVe: this means that y and Y are not the
#   same thing.

# In R, Most code is written within a script. This is basically a text file
#   (saved with the extension ".R") that contains the code you want to run, in
#   the order you want to run it, and with annotation to explain why you did
#   what you did.
# The annotations are in the form of *code comments*. Code comments are lines
#   in the script file that are not to be interpreted by the compiler. Comments
#   are for humans, and they all start with the pound sign (#).
# Code in a script should be organized into sections. To create a new section
#   of code to execute, use the format in this script: six pound signs, two
#   blank spaces, the name of the section, two blank spaces, and enough pound
#   signs to fill out a line 80 characters wide (as measured by the line compass
#   at the bottom left of the script window).


###  Calculation  ###
# Now that we've discussed why the first dozen lines of this script are just
#   words, we can perform some basic calculations. Type the calculation you'd
#   like to execute in the script, then---with the cursor on the specific line
#   you just typed---press (CTRL or CMD) + ENTER
18 - 3
# Now we see something that the calculation we wanted shows up in the console
#   (the window below the scripting window) as "> 18 - 3", and the answer
#   appears on the next line as "[1] 15". Let's unpack this:
#   1. The "> " is called the *prompt*. This is where we enter code into the
#      console. 
#   2. The "[1] " preceeding the result identifies that your result only has one
#      numerical value, and that value is the number 15. **This is important.**


###  Assignment  ###
# Now what if this result was a very important calculation that we wanted to
#   save for later? We can use the *assignment operator* to save this special
#   number: (remember to press CTRL + ENTER to run the line)
x <- 18 - 3
# What happened? We saw that the code "> x <- 18 - 3" appeared in the console,
#   but we don't see a "result". Check the *environment* pane (top right). What
#   do you see? In the *Global Environment*, we see that the variable "x" holds
#   the value 15. However, R doesn't parrot back to you what you just assigned,
#   so if you want to verify that the object "x" does indeed store this value,
#   we execute
x
# Now, we see the result of 18 - 3, which was stored in the object x, printed
#   to the console.


###  Exercises  ###
# 1. Create an object called "myAge" that holds your age *in months*. Hint: the
#    multiplication operator in R is "*".
# 2. Using the object "myAge", approximate the number of days you've been alive.
#    Use 30.44 days per month. Check this against your age in days on Wolfram
#    Alpha. How many days off was your estimate?
# 3. Using the object "myAge", find your decimal age. Hint: the division
#    operator is "/".
# 4. Copy and Paste MyAge into the console and press ENTER. What happens? Why?



######  Vectors  ##############################################################
# Do you remember that the output of "> 18 - 3" was "[1] 15"? This is because
#   your result has one single element in it. But why would R bother to tell you
#   that 18 - 3 was only one number? Because R is *vectorized*. This means that
#   R's default way of thinking is on collections of items, not single items.
#   We make a collection of items with the function "c". Let's make a vector of
#   our ages (in months):
ourAges <- c(365, 333, 314, 350)
ourAges
# Briefly, if we want only the third age in this object, we type
ourAges[3]
#   This is called *subsetting*, and we'll come back to it in the next section.


###  Scalar Computing  ###
# Here's an example: in other languages (like C or Java), if you wanted to add
#   9 months to each of these ages (how old we will be when this class is over),
#   then we'd write a for loop like this:
ourAgesThen <- c(0, 0, 0, 0)
for(i in c(1, 2, 3, 4)){
  ourAgesThen[i] <- ourAges[i] + 9
}
ourAgesThen
# This is a lot of code to unpack. First, we have to create an initial empty
#   object called "ourAgesThen" to hold our calculation, then, for the first,
#   second, third, and fourth ages in the "ourAges" vector, we add nine and
#   store it in the first, second, third, and fourth place in the "ourAgesThen"
#   vector. Overall, it's quite a complicated setup. This is scalar computing.


###  Vector Computing  ###
# However, R doesn't require for loops to perform basic tasks. This is all R
#   needs:
ourAgesThen <- ourAges + 9
ourAgesThen
#   So much simpler! No object initialization, no for loops, no "i" index. This
#   makes much of our code work a lot simpler than it would be otherwise.


###  Sequences  ###
# Our for loop above had a few really ugly pieces. For instance, the sequence
#   from 1 to 4 for the index "i" to use could probably be prettier. Here's how
#   to make integer sequences cleanly in R:
1:4
# Also, we don't necessarily have to stay on the natural numbers:
-3:5
#   or use ascending order for that matter:
10:1
# What if we want a sequence of fractions? We will use the "seq()" function to
#   create more exotic sequences where we control the step size
seq(from = 0, to = 1, by = 0.25)
#   or the length of the vector
seq(from = 0, to = 1, length.out = 5)
# If you ever forget the arguments to the seq function, you can read the help
#   file for it via
?seq


###  Replications  ###
# Another ugly piece of that for loop is the initialization setup. There must
#   be a better way to create a vector of four zeros. There is:
rep(0, 4)
# We can also perform a "replicate each" via
rep(1:5, each = 3)
# Finally, we can create an repeating cycle of a certain length with
rep(-1:1, length.out = 6)


###  Exercises  ###
# 1. Five people start the newest diet craze. Their weights (in kg) before and
#    after were [78 72 78 79 105] and [67 65 79 70 93], respectively. Store
#    these two vectors as "wtBefore" and "wtAfter", respectively. Find the total
#    weight lost, the average weight lost, and the weight lost per person. Hint:
#    see the ?sum and ?mean functions.
# 2. Create the following vectors using the rep() and seq() functions:
#    a) the first non-negative integer powers of 2
#    b) 1, 1.5, 2, 2.5, ..., 12
#    c) 1, 8, 27, 64, ..., 1000
#    d) 1, -1/2, 1/3, -1/4, ..., -1/100
#    e) 1, 0, 3, 0, 5, 0, 7, 0, ..., 0, 49
#    f) 1, 3, 6, 10, 15, ..., 210 (Hint: ?cumsum)
#    g) 1, 2, 2, 3, 3, 3, ..., 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 (Hint: ?rep)
# 3. (ADVANCED) The jth term of the Taylor-MacLaurin series for the natural
#    logarithm is 
#    $$
#    log(1 - x) := - \lim_{n \to \infty} \sum \limits_{j = 1}^n \frac{x ^ j}{j}.
#    $$
#    Find the residuals of this approximation for n = 5, 10, 50, 100 around x =
#    0.25



######  Subsetting Vectors  ###################################################
# We can use subsetting functions to extract individual components of a vector.
#   There are three main methods to subset an *atomic* vector (this is just a
#   fancy way of saying a basic vector). Let's first create a vector of the
#   months we were born in:
birthMonths <- c("March", "May", "June", "January")
# First, notice that we can add English words to a vector by putting each entry
#   in quotes.


###  Subset by Position  ###
# Now, lets extract the month stored in the first element of the vector:
birthMonths[1]
#   If you learned programming in another language, this may surprise you. Some
#   languages start with the first element having index 0, not 1.
# Now let's extract the second and fourth elements (remember that we have to use
#   the c() function to create a vector):
birthMonths[c(2, 4)]
# What if we want the last element of a very long vector? We can use the
#   function "length()" to find out how many elements are in a vector:
length(birthMonths)
# Now that we know how long the vector is, we can subset the vector by its
#   length to extract the last element
birthMonths[length(birthMonths)]


###  Negation Subsetting  ###
# Just as how we could tell R which elements of the vector we wanted, it might
#   be easier to tell R which elements of the vector we *don't* want. This uses
#   "negative subsetting". Let's ask R to give us all of the birth months
#   *except for* the second one:
birthMonths[-2]
# If we want to cut more than one element, we use the c() vector function to
#   create a vector of the elements we don't want.
birthMonths[-c(1, 2)]


###  Basic Logic in R  ###
# Before we dive in to logical subsetting, we first need to understand how R
#   represents formal logic. The letters TRUE (all uppercase) is the R symbol
#   that something is true. The letters FALSE (again, all uppercase) is the
#   symbol that something is false. These words are reserved, meaning that you
#   cannot use them for anything else, they must be spelled exactly, and as
#   always CaSe MaTtErS (just like the rest of R).
TRUE
# Notice that the word changes colour to light blue in the script. This means
#   that R sees this as a reserved word. Now type
True
#   R has no idea what you are talking about.
# Some useful components when dealing with logic are the comparison functions.
#   R has built-in ways to check for equality, inequality, and magnitude 
#   differences. These all return either TRUE or FALSE. They are:
1 == 3 # Is 1 equal to 3?
1 != 3 # Is 1 not equal to 3?
1 > 3  # Is 1 greater than 3? 
1 <= 3 # Is 1 less than or equal to 3?
# Notice that the last question had the word "or" in it. The logical OR and AND
#   operators are | and &, respectively. We could re-write the last check as
1 < 3 | 1 == 3


###  Logical Subsetting  ###
# Now that we understand a little of how logic works, let's use a logical vector
#   (a vector with only TRUE or FALSE elements) to subset our character vector
#   (the vector "birthMonths" is a *character* vector because it only contains
#   elements in quotes). We want the first two birth months:
birthMonths[c(TRUE, TRUE, FALSE, FALSE)]
# What if we want to find which months are in the summer? We can use the logical
#   "is an element of" operator, coded as "%in%". Here's an example:
birthMonths %in% c("June", "July", "August")
# Because this is such a useful topic, we will cover this in more detail next
#   class.


###  Exercises  ###
# 1. Create a vector of the months of the year and store it in an object called
#    "mons".
# 2. You would like to discard the first three months, so you type "mons[-1:3]".
#    What happened? Why should you type instead?
# 3. Find a method to use the "length()" function to find the last four entries
#    of *any* atomic vector. Apply this to find the last four months of the
#    year.
# 4. Logically subset the uppercase vector of English letters in the following
#    ways:
#    a) Type LETTERS and press ENTER. What is your guess to find the lower case
#       letters?
#    b) Create a vector of the first 12 upper-case English letters
#    c) Create a vector of the 1st, 3rd, 5th, 7th, ..., 25th English letters
#    d) Create a vector of the consonants. (Hint: it may be easier to find the
#       letters that are *not* one of the vowels)