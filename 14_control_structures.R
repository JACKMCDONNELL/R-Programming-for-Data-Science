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