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


