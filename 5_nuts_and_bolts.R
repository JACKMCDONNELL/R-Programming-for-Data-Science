x <- 5 # assignment
x # auto-print

print(x) # explicit print, used more in development/programming

x <- 11:30 # integer sequences

attributes(x)

x <- c(0.5, 0.6) # numeric
x <- c(TRUE, FALSE) # logical
x <- c(T, F) # lazy logical
x <- c("a", "b", "c") # character
x <- 9:29 # integer
x <- c(1+0i, 2+4i) # complex

x <- vector("numeric", length=20)

y <- c(1.7, "a") # implicit coercion to character
y <- c(TRUE, 2) # numeric
y <- c("a", TRUE) # character

# explicit coercion

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

# matrix
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)

m <- matrix(1:6, nrow=2, ncol=3)
m


m <- 1:10
m

dim(m) <- c(2,5)
m

# can bind columns or rows

x <- 1:3
y <- 10:12

cbind(x,y)
rbind(x,y)

# lists

x <- list(1, "a", TRUE, 1 + 4i)
x

x <- vector("list", length=5)
x

# factors

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)

# see the underlying representation of factor
unclass(x)

# missing values

x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)

x <- c(1, 2, NaN, NA, 4)
is.na(x)

# so all NaN are NA, but not the other way around
is.nan(x)

# data frames

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x

nrow(x)
ncol(x)

# names

x <- 1:3
names(x)

names(x) <- c("New York", "Seattle", "Los Angeles")

x

names(x)

x <- list("Los Angeles" = 1, Boston = 2, London = 3)
x


m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a", "b"), c("c","d"))
m

colnames(m) <- c("h","f")
rownames(m) <- c("x","z")
m

# reading in data

data <- read.csv("/Users/johnmcdonnell/Dropbox/CWRU Biostats/Categorical Data Analysis/data/Chapter1/Aptima_combo.csv")
# note that the generic read_table is what you would use for .txt files

# data <- read.table("datatable.txt", nrows = 100)
classes <- sapply(data, class)
classes
# tabAll <- read.table("datatable.txt", colClasses = classes)

# using the readr package

library(readr)
aptima_combo <- read_csv("/Users/johnmcdonnell/Dropbox/CWRU Biostats/Categorical Data Analysis/data/Chapter1/Aptima_combo.csv")
aptima_combo

# note you can, and sometimes should, set the coltypes yourself
# teams <- read_csv("data/team_standings.csv", col_types = "cc") 

# readr can easily handle compressed files with no extra effort on the user's part

# logs <- read_csv("data/2016-07-19.csv.bz2", n_max = 10)
# or even better, to avoid difficulties in guessing the column classes
# logs <- read_csv("data/2016-07-19.csv.bz2", col_types = "ccicccccci", n_max = 10)
# logs

# logdates <- read_csv("data/2016-07-19.csv.bz2",
  #+ col_types = cols_only(date = col_date()),
  #+ n_max = 10)

# using textual and binary formats for storing data
y <- data.frame(a = 1, b = "a")
y
dput(y)

## Send 'dput' output to a file
dput(y, file = "y.R")
## Read in 'dput' output from a file
new.y <- dget("y.R")


x <- "foo"
y <- data.frame(a = 1L, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x,y)


source("data.R")
str(y)

# binary formats
a <- data.frame(x = rnorm(100), y = runif(100))
b <- c(3, 4.4, 1 / 3)
b

save(a, b, file = "mydata.rda")
load("mydata.rda")

## Save everything to a file
save.image(file = "mydata.RData")

## load all objects in this file
load("mydata.RData")

x <- list(1, 2, 3)
serialize(x, NULL)

# connections with the outside world

str(file)

## Create a connection to 'foo.txt'
con <- file("foo.txt")

## Open connection to 'foo.txt' in read-only mode
open(con, "r")

## Read from the connection
data <- read.csv(con)

## Close the connection
close(con)

# is all the same as this
data <- read.csv("foo.txt")

con <- gzfile("/Users/johnmcdonnell/Desktop/R Programming for Data Science/datasets/book_datasets/words.gz")
x <- readLines(con, 10)

## Open a URL connection for reading
con <- url("http://www.bw.edu", "r")

## Read the web page
x <- readLines(con)

## Print out the first few lines
head(x)

# subsetting
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[c(1,3,4)]

u <- x > "a"
u
x[u]

x[x > "a"]


x <- matrix(1:6, 2, 3)
x
x[1,2]
x[2,1]

x[1,]
x[,2]

x <- matrix(1:6, 2, 3)
x[1,2]
x[1,2, drop = FALSE]


x[1,, drop = FALSE]

# subsetting lists

x <- list(foo = 1:4, bar = 0.6)
x

x[[1]]
x[["bar"]]
x$bar


x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"

# computed index for "foo"
x[[name]]

x$name

x$foo

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x

x[[c(1, 3)]]
x[[1]][[3]]

x[[c(2, 1)]]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

# partial matching
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]

# removing NA values
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
print(bad)
x[!bad]


x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good

x[good]
y[good]

# note, you can use complete.cases on data framew as well

# vectorized operations
x <- 1:4
y <- 6:9
z <- x + y

x
x > 2
x >= 2
x < 3
y==8

x-y
x*y
x/y

x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2)


## element-wise multiplication
x * y

## element-wise division
x / y

## true matrix multiplication
x %*% y

help(read.table)


# Quiz

#4

x <- 4L
class(x)

#5

x <- c(4, TRUE)
class(x)

#6

x <- c(1, 3, 5)
y <- c(3, 2, 10)
cbind(x,y)



#8

x <- list(2, "a", "b", TRUE)
x[[2]]

#9 

x <- 1:4
y <- 2:3
x + y


#10

x <- c(3, 5, 1, 10, 12, 6)
x[x <= 5] <- 0
x

x <- c(3, 5, 1, 10, 12, 6)
x[x<6] <- 0
x

x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0
x

rm(x,y)

#11

data <- readr::read_csv("/Users/johnmcdonnell/Desktop/R Programming for Data Science/datasets/hw1_data.csv")
head(data)
names(data)

#12

data[1:2,]

#13

nrow(data)

#14

tail(data)

#15

data$Ozone[47]

#16 

sum(is.na(data$Ozone))

#17

good <- complete.cases(data)
complete_data <- data[good,]
mean(complete_data$Ozone)
rm(complete_data)

#18

extract <- data$Ozone >31 & data$Temp >90
question18 <- data[extract,]
complete_cases <- complete.cases(question18)
question18 <- question18[complete_cases,]
mean(question18$Solar.R)

#19 

extract <- data$Month==6
question19 <- data[extract,]
mean(question19$Temp)

#20

extract <- data$Month==5
question20 <- data[extract,]
complete_cases <- complete.cases(question20)
question20<- question20[complete_cases,]
max(question20$Ozone)
