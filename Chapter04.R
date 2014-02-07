######################################################################
# Chapter 4: Basics of R
######################################################################

# 4.3 Data Types
# 1. numeric, 2. character (string), 3. Date and 4. logical

# to check the type of data contained in a variable, use the class function
class (x)

# 4.3.1 Numeric Data
# is.numeric - testing whether a variable is numeric
is.numeric(x)

# is.integer - testing whether a variable is a whole number
i <- 5L
is.integer(i)

# 4.3.2 Character Data
x <- "data"
y <- factor("data")

# nchar - to find the length of a character
nchar(x)

# 4.3.3 Dates
# most useful are Date (stores date only) and POSIXct (stores date and time)
date1 <- as.Date("2014-02-06")
class(date1)
as.numeric(date1)
date2 <- as.POSIXct("2014-02-06 22:20")
class(date2)
as.numeric(date2)

# 4.3.4 Logical - representing data that can be either TRUE or FALSE
# is.logical - test for logical data types
k <- TRUE
class(k)
is.logical(k)

# 4.4 Vectors
c(One="a", Two="y", Last="r")
w <- 1:3
names(w) <- c("a", "b", "c") # name the elements

# 4.4.2 Factors - Important concept in R, especially when building models
# create simple vector of text data that has few repeats
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
q2Factor <- as.factor(q2)
as.numeric(q2Factor)

# to set order of a factor such as when coding education levels
factor(x=c("High School", "College", "Masters", "Doctorate"), levels=c("High School", "College", "Masters", "Doctorate"), ordered=TRUE)

# 4.7.1 Missing Data - NA
# NA is seen as just another element of a vector and can be tested using is.na()
# Handling missing data is an important part of statistical analysis, and has many 
# techniques depending on field and preference. One popular technique is multiple imputation
z <- c(1, 2, NA, 8, 3, NA, 3)
is.na(z)
zChar <- c("Hockey", NA, "Lacrosse")
is.na(zChar)

# 4.7.2 Missing Data - NULL
# NULL is the absence of anything. It represents nothingness. Important diff between NA
# and NULL is that NULL is atomical and cannot exist within a vector. If used within a vector, 
# it will simply disappear. Therefore, NULL is appropriately not vectorized
d <- NULL
is.null(d)
is.null(7)
