##############################################################################
# Chapter 05 - Advanced Data Structures
# 
# Allows for complex storage - data.frame, matrix, list, array
# data.frame -> for those familiar with spreadsheets
# matrix -> for those familiar with matrix math
# list -> for those familiar with programming
##############################################################################

##############################################################################
# 5.1 data.frames
# Most commonly used, and has columns and rows. In statistical terms, each column 
# is a variable, and each row is an observation. R organizes each column as a variable, 
# each of which has the same length. This is important, as it allows each column to 
# hold a different type of data
#
##############################################################################

# construct the data.frame
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(x, y, q)
theDF <- data.frame(First=x, Second=y, Sport=q)

# data frame comes with a lot of attributes. A few of them are listed below
nrow(theDF)       # check number of rows in a data frame
ncol(theDF)       # check number of columns in a data frame
dim(theDF)        # check both number of rows and columns in a data frame
names(theDF)      # check the names of the columns
names(theDF)[3]   # check the names of the 3rd column
rownames(theDF)   # check the names of the row in a data frame
rownames(theDF) <- c("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten") # assign names to each row
rownames(theDF) <- NULL # set them back to generic index
head(theDF)       # prints out the first few rows in a data frame
head(theDF, n=7)  # prints out the first 7 rows in a data frame
tail(theDF)       # prints out the last few rows in a data frame
class(theDF)      # check the class of a data frame variable
theDF$Sport       # access individual column within a data frame variable
theDF[3, 2]       # access individual elements within a data frame by their position (row 3, column 2)
theDF[3, 2:3]     # access more than one elements within a data frame by its position (row 3, column 2 to 3)
theDF[c(3, 5), 2] # access rows 3 and 5, column 2. Since only 1 column is selected, it was returned as a vector and hence no column names are printed
theDF[c(3, 5), 2:3] # access rows 3 and 5, column 2 through 3
theDF[, 3]        # access all of column 3
theDF[, 2:3]      # access all of column 2 through 3
theDF[2, ]        # access row 2
theDF[2:4, ]      # access row 2 through 4
theDF[, c("First", "Sport")]  # access multiple columns by name
theDF[, "Sport"]  # access just the "Sport" column by name
theDF["Sport"]    # returns a one column data.frame
class(theDF["Sport"])   # check class of the one column data frame
