## Put comments here that give an overall description of what your
## functions do

## The function "makeCacheMatrix" creates a special "matrix", 
## which is list containing a function to: 
## (1)set the value of the matrix,
## (2) get the value of the matrix, 
## (3) set the value of the inverse matrix,
## (4) get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }

  get <- function() x 
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## The "cacheSolve" calculates the inverse of the special "matrix" created with the above function.
## It first checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation. 
## If not, it calculates the inverse of the original matrix and sets the value in the cache 
## via the setinverse function.

cacheSolve <- function(x, ...) {

  inv <- x$getinverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}