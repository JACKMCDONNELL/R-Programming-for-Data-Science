# if / else

x <- runif(1,0,10)
if(x > 3) {
  y <- 10
} else {
  y <- 0 
}

# equivalently

y <- if(x >3) {
  10
} else {
  0
}

## FOR LOOPS

for(i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")

for(i in 1:4) {
  ## Print out each element of 'x'
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i]) # can omit curly braces in one-line loops

# NESTED FOR LOOPS

x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}

# WHILE LOOPS

count <- 0

while(count <10) {
  print(count)
  count <- count + 1
}

z <- 5
set.seed(1)

while(z >= 3 && z <= 10) {
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}

print(z)

# repeat loops

x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate()
  
  if(abs(x1 - x0) < tol) { ## Close enough?
    break
  } else {
    x0 <- x1
  }
}

# next/break

for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next
  }
  ## Do something here
}

for(i in 1:100) {
  print(i)
  
  if(i > 20) {
    ## Stop loop after 20 iterations
    break
  }
}

# functions

f <- function() {
  ## This is an empty function
}

## Functions have their own class
class(f)

## Execute this function
f()

# simple function for adding two numbers
add2 <- function(x,y) {
  x + y
}
add2(3,5)

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x,n) {
  use <- x > n
  x[use]
}

above(15,2)

above <- function(x,n=10) {
  use <- x > n
  x[use]
}

above(11)

columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

x <- matrix(1:6, 2, 3)

columnmean(x)

f <- function(a, b=1, c=2, d=NULL){
  
}

# lazy evaluation

f <- function(a,b) {
  a^2
}
f(2) # no error, because b is never used anyways

f <- function(a, b) {
  print(a)
  print(b)
}

f(45)

# ... (see text) 

# scoping rules 

search()

# lexical scoping

f <- function(x,y) {
  x^2 + y / z # note that z does not have an assigned value - it is a free variable
}

# what value gets assigned to z?
# depends on values in the parent environment. R just keeps going down sequence of parent environments
# if can't find the value, throws an error
f(2,5)

# optimization in R

make.NegLogLik <- function(data, fixed = c(FALSE, FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    
    ## Calculate the Normal density
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2) / (sigma^2)
    -(a + b)
  }
}


set.seed(1)
normals <- rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL

ls(environment(nLL))

optim(c(mu = 0, sigma = 1), nLL)$par

nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum

nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum

## Fix 'mu' to be equalt o 1
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)

## Evaluate 'nLL()' at every point in 'x'
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

# dates and time

# coerce date from a character

x <- as.Date(("1970-01-01"))
x

unclass(x)
unclass(as.Date("1970-01-02"))

# coerce time

x <- Sys.time()
x
class(x)

p <- as.POSIXlt(x)
names(unclass(p))
p$sec

x <- Sys.time()
x ## already in POSIXct format
unclass(x)

x$sec # error because not POSIXlt
p <- as.POSIXlt(x)
p$sec

# strptime function converts dates in other formats to POSIX

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")

x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)
?strptime

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y

x <- as.POSIXlt(x)
x-y

# keeps track of tricky things, like leap years
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x






