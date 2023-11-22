
######################################################################
# source => 
# https://r4ds.had.co.nz/introduction.html
# Hadley Wickham R for Data Science
# https://statsandr.com/blog/descriptive-statistics-in-r/
# https://statsandr.com/blog/data-types-in-r/
#
# Author: George Campanis
# Date: 15-Nov-2023
# Purpose: Teaching Summary Stats to DA Group 
###################################################################


#*----------------------------------------------------------------
# Notes: 
# Execute script block -      then Ctrl + Enter
# ctrl l clears screen
# ctrl shift C will comment all selected code
#-----------------------------------------------------------------


install.packages("tidyverse")
install.packages("pastecs")# more stats


library(tidyverse)

# install some data packages 
install.packages(c("nycflights13", "gapminder", "Lahman")) # used 

#--------------------
# coding basics
#--------------------
# Math
1 / 200 * 30
(59 + 73 + 2) / 3
sin(pi / 2)

# var assignment
x <- 3 * 4
x = 3 * 4
# enclosing bracket will print to console
(x = 3 * 4)

# display var
x

# calling functions
# e.g seq()  makes regular sequences of number
seq(1, 10)

# enclose in parentheses to display automatically after assignment
(y <- seq(1, 10, length.out = 5))

# enclose in parentheses to display automatically after assignment
(z <- seq(5, 15, length.out = 10))


# ? is the syntax for help
?seq()
?sd()

# press  Alt + Shift + K and see what happens

library(nycflights13)
library(tidyverse)

# ?<library name>::<function name> to see help for the library's function
# needs the double colons
?dplyr::filter() 
?stats::filter()

?filter() 





# show flights data
flights # data type is a tibble ---more on this later

# view flights and Iris dataset in RStudio Viewer
View(flights)
View(iris)
view(y)

# R var types
#  int stands for integers.
#  dbl stands for doubles, or real numbers.
#  chr stands for character vectors, or strings.
#  dttm stands for date-times (a date + a time).
#  lgl stands for logical, vectors that contain only TRUE or FALSE.
#  fctr stands for factors, which R uses to represent categorical variables with fixed possible values.
#  date stands for dates.




# https://statsandr.com/blog/data-types-in-r/
# c is used in R to concatenate 
num_data <- c(3, 7, 2)# numeric series without decimals
num_data_int <- as.integer(num_data)
# Combine Values Into A Vector Or List
# Try run it....https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/c

class(num_data) # identifies class of data
typeof(num_data) # to get data type

class(num_data_int) # identifies class of data after cast in integer
typeof(num_data_int) # to get data type after cast in integer

# to hardcode integers
hardcode_int_data = c(3L, 6L, 7L)
typeof(hardcode_int_data) 

# of string data
string_data = c("apple", "orange", "banana", 4L)
class(string_data) # identifies class of data after cast in integer
typeof(string_data) # to get data type after cast in integer
(string_data)


num_data_dec <- c(3.4, 7.1, 2.9)
class(num_data_dec)
# also possible to check the class thanks to str()
# shows the structure of the data
str(num_data_dec)

int_nums = as.integer(num_data_dec)# convert data types

###################################
# Chars
#################################
char <- "some text" # strings
char
class(char)

numAsChar= as.character(int_nums)

# case and space sensitivity 
char_space <- "text "
char_nospace <- "text"
# is char_space equal to char_nospace?
char_space == char_nospace # not equal


char_space <- "Text"
char_nospace <- "text"
# is char_space equal to char_nospace?
char_space == char_nospace # not equal


##############################################
# Factors
# factors are categorical
#############################################
gender <- factor(c("female", "female", "male", "female", "male"))
gender

levels(gender)


fruit = factor(c("apple", "pear", "banana", "apple", "grape"))
levels(fruit)

#By default, the levels are sorted alphabetically
text <- c("test1", "test2", "test1", "test1") # create a character vector
class(text) # to know the class

text_factor <- as.factor(text) # transform to factor
class(text_factor) # recheck the class

##############################################
# Logical
# are boolean true or false
#############################################
value1 <- 7
value2 <- 9

# is value1 greater than value2?
(greater <- value1 > value2)
(less <- value1 < value2)
class(greater)
class(less)
# is value1 less than or equal to value2?
less <- value1 <= value2
less

# FALSE values equal to 0 and TRUE values equal to 1:
greater_num <- as.numeric(greater)
greater_num  # Value of 0 because it is False
less_num <- as.numeric(less)
less_num # Value of 1 because it is true
# also we can take an int and get a logical
x <- 0
typeof(x)
as.logical(x) # false

a <- 1
typeof(a)
as.logical(a) # true

b <- 3
typeof(b)
as.logical(b) # true

c <- -3
typeof(c)
as.logical(c) # true

d <- -0
typeof(d)
as.logical(d) # false

################
# VECTORS
################
x<- c(1,2,3,10,5)
2 * x
typeof(x)
length(x)
class(x)
str(x)
x[0] # R indexes do not start at 0, they start at 1
# this gives the value is numeric(0)
x[1] # This is the first index of the vector
x[4] # this 

x1<- c(1L,2L,3L,10L,5L)
2 * x
typeof(x1)
length(x1)
class(x1)
str(x1)

(z <- c(x,4)) # adds the x vector to z variable with the number 4

# Vectors can only be one type
xx <- c(1.7, "a") # if string value, all values will be string
xx <- c(19, TRUE, FALSE) # True/False will become bit integer values
xx

yy <- c(1.0, 1.4,3) # the integer becomes a float data type
yy

#########
# LISTS
#########
# Create lists using llist or coerce other objects using as.list()

(x <- list(1, "a", TRUE, 1+4i)) # Creates 4 lists with one entry in each

x[3][1] # [array #, index #] == [1] TRUE
x <- 1:10
(x <- as.list(x))
length(x)

temp <- list(list(list(list())))
temp(is.recursive(temp))

#list vs vector
(av= vector(1,2,TRUE))
(al=list(1,2,TRUE))
#We can use unlist() to convert the list into a vector.
(alf=list("apples","pears","strawberry"))

# check if it is a vector
is.atomic(alf)

# check if it is a list
is.list(al)

############################################
# apply(), lapply(), sapply(), tapply()
# https://www.guru99.com/r-apply-sapply-tapply.html

# apply(X, MARGIN, FUN)
# Here:
#  -x: an array or matrix
#  -MARGIN:  take a value or range between 1 and 2 to define where to apply the function:
#  -MARGIN=1`: the manipulation is performed on rows
#  -MARGIN=2`: the manipulation is performed on columns
#  -MARGIN=c(1,2)` the manipulation is performed on rows and columns
#  -FUN: tells which function to apply. Built functions like mean, median, sum, min, max and even user-defined functions can be applied>

(m <- matrix(nrow = 2, ncol = 2))
dim(m)
# same as
attributes(m)

# Matrices are constructed columnwise
(m <- matrix(1:6, nrow=2, ncol =3))
m1 <- 1:10 #takes a vector
m1 # print the vector

dim(m1) <- c(2,5) # concatenate the dimensions
# can only create enough element spaces based on the vectors provided
m1 # print the new dimensional matrix

m2 <- matrix(C<-(1:10),nrow=2, ncol=2)
dim(m2)
## SAME AS
attributes(m2)

a_m1 <- apply(m1, 2, sum)
a_m1
# combining rows and/or cols
x <- 1:3 # vector with 3 numbers
y <- 10:12 # vector with 3 numbers
x
y
cbind(x,y) # column bind them together
# or
rbind(x,y) # row bind them together

##############################################
#  DataFrames
#  A data frame is a very important data type in R. It's pretty much the de facto data structure for most tabular data and what we use for statistics.
#  data frames can have additional attributes such as rownames().
##############################################
# Data frames Usually created by read.csv and read.table.
# Create with data.frame() function.
# Convert to matrix with data.matrix()

(df = data.frame(id = letters[1:10], x = 1:10, y = rnorm(10)))
# rnorm -> z score standard deviation values randomly assigned

# id  x           y
# 1   a  1  0.45559580
# 2   b  2  1.52023025
# 3   c  3  0.08914295
# 4   d  4 -1.14923368
# 5   e  5 -1.44883928
# 6   f  6 -1.52872295
# 7   g  7  0.41131155
# 8   h  8  1.36385494
# 9   i  9  0.29850020
# 10  j 10 -1.78673009

# naming cols
x <- 1:3
names(x) <- c("rich", "daniel", "diego")
x
# using names() will name the columns which can then can be called
x <- as.list(1:10) # creates list 1 to 10
names(x) <- letters[seq(x)] # assigning letter sequence to list x
x

n <- matrix(1:10, nrow = 2)
n
# [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10
n1 <- matrix(1:10)
n1
#       [,1]
# [1,]    1
# [2,]    2
# [3,]    3
# [4,]    4
# [5,]    5
# [6,]    6
# [7,]    7
# [8,]    8
# [9,]    9
# [10,]   10
n2 <- matrix(1:10, ncol = 2)
n2
# [,1] [,2]
# [1,]    1    6
# [2,]    2    7
# [3,]    3    8
# [4,]    4    9
# [5,]    5   10

m <- matrix(1:4, nrow = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d")) # c(x rows),c(y columns)
m
#   c d
# a 1 3
# b 2 4
# first element = rownames
# second element = colnames

############################################
# Missing values
# denoted by NA and/or NaN for undefined mathematical operations.
############################################

# missing values are represented by the symbol NA (not available). Impossible values (e.g., dividing by zero) are represented by the symbol NaN (not a number)

# is.na()
# is.nan()
# always check both

x <- c(1,2, NA, 4, 5)
is.na(x) #returns logical. shows third
# [1] FALSE FALSE  TRUE FALSE FALSE

is.nan(x) # none are NaN.
# [1] FALSE FALSE FALSE FALSE FALSE

x <- c(1,2, NA, NaN, 4, 5)
is.nan(x) 
# [1] FALSE FALSE FALSE  TRUE FALSE FALSE

is.na(x)
# [1] FALSE FALSE  TRUE  TRUE FALSE FALSE

############################################
# Helpful Fns
############################################
# str() Compactly display the internal structure of an R object. Perhaps the most uesful diagnostic function in R.
# names() Names of elements within an object
# class() Retrieves the internal class of an object
# length() Retrieve or set the dimension of an object.
# dim() Retrieve or set the dimension of an object.


############################################
# apply(), lapply(), sapply(), tapply()
# https://www.guru99.com/r-apply-sapply-tapply.html

# apply for functions
# apply(X, MARGIN, FUN)
# Here:
#  -x: an array or matrix
#  -MARGIN:  take a value or range between 1 and 2 to define where to apply the function:
#  -MARGIN=1`: the manipulation is performed on rows
#  -MARGIN=2`: the manipulation is performed on columns
#  -MARGIN=c(1,2)` the manipulation is performed on rows and columns
#  -FUN: tells which function to apply. Built functions like mean, median, sum, min, max and even user-defined functions can be applied>

m1 <- matrix(C<-(1:10),nrow=5, ncol=6)
m1
#       [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    6    1    6    1    6
# [2,]    2    7    2    7    2    7
# [3,]    3    8    3    8    3    8
# [4,]    4    9    4    9    4    9
# [5,]    5   10    5   10    5   10

######
# Function on a column
######
a_m1 <- apply(m1, 2, sum) # (m1 = matrix, 2 = Margin, sum = Function)
a_m1       # Margin 1 is rows and margin 2 is columns              
# [1] 15 40 15 40 15 40

######
# Function on a row
######
a_m1 <- apply(m1, 1, sum) # (m1 = matrix, 2 = Margin, sum = Function)
a_m1

######################################
# L Apply (Lists)
#####################################
#   lapply(X, FUN)
#   Arguments:
#   -X: A vector or an object
#   -FUN: Function applied to each element of x

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

######################################
# S Apply (Vectors)
#####################################
# same job as lapply() function but returns a vector.
#   sapply(X, FUN)
#   Arguments:
#   -X: A vector or an object
#   -FUN: Function applied to each element of x

# We can measure the minimum speed and stopping distances of cars from the cars dataset.
dt <- cars
lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min)
lmn_cars


smn_cars

######################################
# T Apply (Factors)
#####################################
# tapply() computes a measure (mean, median, min, max, etc..) or a function for each factor variable in a vector.

# tapply(X, INDEX, FUN = NULL)
# Arguments:
# -X: An object, usually a vector
# -INDEX: A list containing factor
# -FUN: Function applied to each element of x

data(iris)
tapply(iris$Sepal.Width, iris$Species, median)
#     setosa versicolor  virginica 
#        3.4        2.8        3.0 


# => https://statsandr.com/blog/descriptive-statistics-in-r/
# stats summary 

dat <- iris # load the iris dataset and renamed it dat

View(iris)

head(dat,25) # first 6 observations
str(dat) # structure of dataset

levels(iris$Species) # note $ refers to col


#############
# min, max
#############
min(dat$Sepal.Length)
max(dat$Sepal.Length)

#############
# RANGE
#############
range(dat$Sepal.Length)

# note: we can get array num starting  @ 1,2,...n
arr=range(dat$Sepal.Length)
arr[1]
# or like this
range(dat$Sepal.Length)[2]


# The range is the difference between the maximum and the minimum value
rng= max(dat$Sepal.Length) - min(dat$Sepal.Length)
rng

# create a func
fnRange = function(x) {
  range <- max(x) - min(x)
  return(range)
}

fnRange(dat$Sepal.Length)
fnRange(dat$Petal.Length)

##################################
#  Standard deviation and variance
##################################
sd(dat$Sepal.Length) # standard deviation
var(dat$Sepal.Length) # variance

variance= (sd(dat$Sepal.Length))^2
stdDev = sqrt(variance)
# computed using sample formulae i.e. n-1

o=lapply(dat[, 1:4], sd)
o[4]

head(dat)
summary(dat)