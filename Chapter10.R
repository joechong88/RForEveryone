##############################################################################
# Chapter 10 - Loops, The Un-R Way to Iterate
# 
##############################################################################

##############################################################################
# 10.1 for Loops
# Most commonly used loop, it iterates over an index, provided as a vector
# and performs some operations
##############################################################################

# print out the 1st 10 numbers
for (i in 1:10)
{
  print(i)
}

# build a vector holding fruit names
fruit <- c("apple", "banana", "pomegranate")

# make a variable to hold their lengths, with all NA to start
fruitLength <-rep(NA, length(fruit))

# give it names
names(fruitLength) <- fruit

# loop through the fruit assiging their lengths to the result vector
for (a in fruit)
{
  fruitLength[a] <- nchar(a)
}

# the above is the long way, should leverage R's built-in vectorization to make this easier
fruitLength2 <- nchar(fruit)
names(fruitLength2) <- fruit

# compare if fruitLength and fruitLength is identical
identical(fruitLength, fruitLength2)

##############################################################################
# 10.2 while Loops
# Not used as much
##############################################################################
x <- 1
while (x<=5)
{
  print(x)
  x <- x+1
}

##############################################################################
# 10.3 Controlling Loops
# Using next and break
##############################################################################

for (i in 1:10)
{
  if (i==3)
  {
    next
  }
  print(i)
}

for (i in 1:10)
{
  if (i==4)
  {
    break
  }
  print(i)
}