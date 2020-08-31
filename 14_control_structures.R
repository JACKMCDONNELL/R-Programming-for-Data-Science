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