##############################################################################
# Chapter 07 - Statistical Graphics
# 
##############################################################################

##############################################################################
# 7.1 Base Graphics
# Recommend to spend more time in learning about ggplot2, but for completeness
# learn base in order to understand basic, as well as modify 
##############################################################################

# 7.1.1 Base Histograms - The most common graph of data in a single variable
# shows the distribution of values for that variable
hist(diamonds$carat, main="Carat Histogram", xlab="Carat")

# 7.1.2 Base Scatterplot - Good to see 2 variables in comparison with each other
# ~ allows us to see y vs x variables
plot(price ~ carat, data=diamonds)
plot(diamonds$carat,diamonds$price) # alternative way of plotting scatterplots using the variables directly

# 7.1.3 Boxplots - Greatly debated among statistics community. 
# The thick middle line represents the median and the box is bounded by the 1st and 3rd quartiles
# The middle 50% of data (the Interquartile Range or IQR) is held in the box
# The lines extend out to 1.5*IQR in both directions
# Outlier points are then plotted beyond that
# NOTE that while 50% of the data are very visible in the box, the remaining 50% of the data are not really displayed
boxplot(diamonds$carat)

##############################################################################
# 7.2 ggplot2
# ggplot2 and lattice were built to make graphing easier, where ggplot2 had overexceeded lattice
# syntax hard to grasp, but its easier to delineate data by color, shape or size and add legends
# 
##############################################################################

# 7.2.1 Plot histogram and densities
# histogram display counts of data in buckets in discrete manner
ggplot(data=diamonds) + geom_histogram(aes(x=carat))

# density plots show the probability of observations falling within a sliding window 
# along the variable of interest. Display of data in continuous measurement
ggplot(data=diamonds) + geom_density(aes(x=carat), fill="grey50")

# 7.2.2 ggplot2 Scatterplots

# The initial scatterplot from 7.2.1
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
g <- ggplot(diamonds, aes(x=carat, y=price))
g + geom_point(aes(color=color))

# using facet_wrap and facet_grid to split the scatterplots
g + geom_point(aes(color=color)) + facet_wrap(~color)
g + geom_point(aes(color=color)) + facet_grid(cut ~ clarity)

# using facet_wrap to split histograms
ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)

# 7.2.3 ggplot2 Boxplots and Violin Plots
ggplot(diamonds, aes(y=carat, x=1)) + geom_boxplot()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot()

# changing to violin plots - this plot is similar to boxplots except the curviness gives a 
# sense of density of the data, thus providing more information than the straight sides of
# ordinary boxplots
ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_point() + geom_violin()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin() + geom_point()  # different order of positioning

# 7.2.4 ggplot2 Line Graphs
# often used when one variable has a certain continuity, but not always necessary because there is often
# a good reason to use a line with a categorical data
ggplot(economics, aes(x=date, y=pop)) + geom_line()

# A common task for line plots is displaying a metric over the course of a year for many years
# e.g. prepare the economics data by using Wickham's lubridate package which has functions to manipulate dates
# need to create 2 new variables, year and month, but to simplify it we'll subset to only start from 2000
require(lubridate)

# create year and month variables
