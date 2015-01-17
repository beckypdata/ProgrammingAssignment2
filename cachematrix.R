## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(xinv) m <<- xinv
  getinverse <- function() m
  list(set = set, get = get, 
       setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}

z <- matrix(sample(1:100, 16), 4, 4)
print(z)
w <- makeCacheMatrix(z)
print(w)
zinv <- cacheSolve(w)
print(zinv)
zinv <- cacheSolve(w)
print(zinv)
print(z%*%zinv)
