##This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) { ##We set x to be an empty matrix
  j <- NULL
  set <- function(y){
    x <<- y
    j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}



## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
  ## To return the inverse of 'x'
  j <- x$getInverse()
  if(!is.null(j)){ ##Checks to see if j is not empty so it caches the matrix
    message("getting cached data")
    return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}