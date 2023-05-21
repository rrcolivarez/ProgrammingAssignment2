## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #Initialization 
  s <- NULL
  #Set the matrix
  set <- function (y){
  x <<- y
  s <<- NULL
  }
  get <- function() x #get the matrix #Return the matrix
  setsolve <- function(solve) s<<- solve #set the value of the inverse mattrix
  getsolve <- function () s #get the value of the inverse matrix #Returns the inverse
  list(set = set, get = get, #returns th list of methods
       setsolve = setsolve,
       getsolve = getsolve)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  s <- x$getsolve() #Return a matrix that is the inverse of x
  if(!is.null(s)) { #Return the inverse if it its already set
    message("getting the inversed matrix")
    return(s)
  }
  data <- x$get() #get the matrix from the object
  s <- solve(data, ...)
  x$setsolve(s)
  s    ## Return a matrix that is the inverse of 'x'
}


#Try the following to run a sample computation
myMatrix <- matrix(c(1, 2, 3, 4), nrow = 2)
myObj <- makeCacheMatrix()
myObj$set(myMatrix)
cacheSolve(myObj)
#Output will be as follows:
#      [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5


