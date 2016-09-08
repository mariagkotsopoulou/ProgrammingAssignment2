

################################### TESTING FUNCTION ############################################
## Function to test correct functioning of the cacheSolve function
## the function cacheSolve is executed twice to check 
## the execution time between the two executions
## the second time we expect the time to be smaller 
## and the inverse of the matrix to be retrieved from the cache
## the execution time of the first and second time of the function execution is printed out

source('cachematrix.R')

testinversematrixcache <- function(x) {
  installorRequirePackage <- function(p) {
    if (!is.element(p, installed.packages()[,1]))
      install.packages(p, dep = TRUE)
    require(p, character.only = TRUE)
  }
  installorRequirePackage("microbenchmark") #accurately measure and compare the execution time
  
  m  <- makeCacheMatrix(x) 
  
  list(firsttime = microbenchmark (firsttime= cacheSolve(m) ,times=1),
       secondtime= microbenchmark (secondtime= cacheSolve(m) ,times=1) )
  
}

# set.seed(237)
# r <- rnorm(1000000)
# mat <- matrix(r, nrow=1000, ncol=1000)
# testinversematrixcache(mat)
 

