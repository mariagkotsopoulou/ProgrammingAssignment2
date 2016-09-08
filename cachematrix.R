
############## CACHE MATRIX INVERSE FUNCTIONS  ######################################################
# The following two functions serve for caching the inverse of a matrix.
# The function cacheSolve computes the inverse of the matrix 
# returned by the function makeCacheMatrix



## This function returns a list containing functions that perform the following:
# 1.set the value of the matrix : set
# 2.get the value of the matrix : get
# 3.set the value of the inverse : setinverse
# 4.get the value of the inverse : get inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inversematrix) inv <<- inversematrix
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then it retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  return(inv)
}


