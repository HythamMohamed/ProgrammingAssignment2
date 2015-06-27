## Below two functions are going to create a special matrix
## and compute the inverse of the `matrix X` if it was not calculated earlier 
## and cache the value and if it was calculated earlier then it will just return the 
## cached result.


## `makecacheMatrix` function will create the special `matrix X` and will contatin 
## a list of functions to set, get, setinverse and getinverse subfunctions.

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  set <- function(y)
  {
    inverse <<- NULL
    x <<- y
  }
  
  get <- function()
  {
    x
  }
  
  setinverse <- function(inv)
  {
    inverse <<- inv
  }
  
  getinverse <- function()
  {
    inverse
  }
  
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  
}


## `cacheSolve` function will return the inverse of the special `matrix X` created by
## the previous function, it will either calculate the inverse of the matrix and store it 
## to cache or just read it from the cache if it was calculated earlier.

cacheSolve <- function(x, ...) {
  
  inverse <- x$getinverse()
  
  if(!is.null(inverse))
  {
    message("getting cached data:")
    return(inverse)
  }
  
  inverse <- solve(x$get())
  x$setinverse(inverse)
  inverse
  
}
