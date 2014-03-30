##############################################################################
# Chapter 09 - Control Statements
# 
##############################################################################

##############################################################################
# 9.1 if and else
# Logical operator with ==, <, >, <=, >=, !=
##############################################################################
as.numeric(TRUE)

toCheck <- 1
if (toCheck == 1)
{
  print("hello")
}
if (toCheck == 0)
{
  print("hello")
}

# first create the function
check.bool <- function(x)
{
  if (x==1)
  {
    # if the input is equal to 1, print hello
    print("Hello")
  }
  else if (x==0)
  {
    # otherwise print goodbye
    print("Goodbye")
  }
  else
  {
    print("Confused")
  }
}

check.bool(1)
check.bool(0)
check.bool("k")
check.bool(TRUE)

##############################################################################
# 9.2 switch
# Check multiple cases
##############################################################################
use.switch <- function(x)
{
  switch(x, 
        "a" = "first", 
        "b" = "second", 
        "z" = "last", 
        "c" = "third", 
        "other")
}

use.switch("a")
use.switch("b")
use.switch("c")
use.switch("d")
use.switch("e")
use.switch("z")

##############################################################################
# 9.3 ifelse
# Similar to the if function in Excel
# accepts 1st argument as condition, 2nd argument as value returned if its true
# more useful if you'd like to test on a vector
##############################################################################

# see if 1 == 1
ifelse(1==1, "yes", "no")
ifelse(1==0, "yes", "no")
toTest <- c(1, 1, 0, 1, 0, 1)

ifelse(toTest==1, "Yes", "No")
ifelse(toTest==1, toTest*3, toTest)

toTest[2] <- NA
ifelse(toTest==1, "Yes", "No")
ifelse(toTest==1, toTest*3, toTest)

##############################################################################
# 9.4 Compound Tests
# Applied when you want to test more than 1 relationship
# Using logical operator 'and' and 'or'- &, &&, |, ||
##############################################################################
a <- c(1, 1, 0, 1)
b <- c(2, 1, 0, 1)

# this checks each element of a and each element of b
ifelse(a==1 & b==1,"Yes", "No")

# this only checks the first element of a and the first element of b, returning only 1 result
ifelse(a==1 && b==1 ,"Yes", "No")
