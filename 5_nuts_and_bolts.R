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


