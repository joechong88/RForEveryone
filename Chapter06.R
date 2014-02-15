##############################################################################
# Chapter 06 - Reading Data into R
# 
##############################################################################

##############################################################################
# 6.1 Reading CSVs
# Best way is to use read.table, and the result is a data.frame object
# read.table arguments
# 1st - full path of file to be loaded
# 
##############################################################################

theURL <- "http://www.jaredlander.com/data/Tomato%20First.csv"
tomato <- read.table(file=theURL, header=TRUE, sep=",") # other possible separator values are "\t", ";"
head(tomato)

# to resolve CSVs file which has "," within a cell, use read.csv2 or read.delim2 instead of read.table

# Using stringsAsFactors to prevent character columns from being converted to factor columns. 
# This saves computation time, and keeps the columns as character data, which are easier to work with
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors=FALSE)

##############################################################################
# 6.2 Excel Data
# R has issues reading from Excel file, hence, its better to convert an Excel file into CSV first
# and use the read.table command 
##############################################################################

##############################################################################
# 6.3 Reading from databases
# require(RODBC)  - this is needed to connect to databases via ODBC
##############################################################################

db <- odbcConnect("QV Training")
# simple SELECT * query from one table
ordersTable <- sqlQuery(db, "SELECT * FROM Orders", stringsAsFactors=FALSE)
detailsTable <- sqlQuery(db, "SELECT * FROM [Order Details]", stringsAsFactors=FALSE)

# do a join between the two tables
longQuery <- "SELECT * FROM Orders, [Order Details] WHERE Orders.OrderID = [Order Details].OrderID"
detailsJoin <- sqlQuery(db, longQuery, stringsAsFactors=FALSE)

# check the results
head(ordersTable)
head(detailsTable)
head(detailsJoin)

##############################################################################
# 6.4 Data from Other Statistical Tools
# Ability to read from commonly used statistical tools - SPSS, Stata, SAS, Octave, Minitab, Systat
# Functions available - read.spss, read.dta, read.ssd, read.octave, read.mtp, read.systat
# All function returns the data as a data.frame, but do not always succeed
# SAS data is normally protected by requiring a valid SAS license to read. This can be sidestepped using
# Revolution R from Revolution Analytics with the function RxSasData in the RevoScaleR package
##############################################################################

##############################################################################
# 6.5 R Binary Files
##############################################################################
# save the tomato data.frame to disk
save(tomato, file="tomato.rdata")
# remove tomato from memory
rm(tomato)
# check if it still exists
head(tomato)
# read it from the rdata file
load("tomato.rdata")
head(tomato)

# try adding a few objects to store in a single RData file, remove and load again
n <- 20
r <- 1:10
w <- data.frame(n, r)
save(n, r, w, file="multiple.rdata")
rm(n, r, w)
load("multiple.rdata")

##############################################################################
# 6.6 Data included with R
##############################################################################
require(ggplot2)
data(diamonds)
head(diamonds)

##############################################################################
# 6.7 Extract Data from Web Sites
##############################################################################

# 6.7.1. Simple HTML tables - use readHTMLTable
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool"
bowlPool <- readHTMLTable(theURL, which=1, header=FALSE, stringsAsFactors=FALSE)
bowlPool

