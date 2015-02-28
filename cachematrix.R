## These are a couple of functions that create a matrix, store the matrix 
## within a list of functions, invert the matrix, and cache the inverted 
## matrix to save from repeating the computation. They are designed as a 
## learning exercise for working with lexical scoping in R


## This function creates a list of functions and stores an inputed matrix
## in the list

makeCacheMatrix <- function(x = matrix()) {
  #create an empty variable to fill later
  invert <- NULL
  #a function that allows the user to replace the matrix  
  set <- function(y) {
    x <<- y
    invert <<- NULL  
    }
  # a function that calls the stored matrix
  get <- function() {
    x
    }
  # a function that inverts the original matrix and stores it
  setinvert <- function(solve) {
    invert <<- solve
    }
  # a function that calls the stored inverted matrix
  getinvert <- function(){
    invert
    } 
  # a list that holds the above functions
  list(set = set, get = get,
      setinvert = setinvert,
      getinvert = getinvert)
}




## This function returns an inverted matrix by calling 
## the functions within the list created by makeCacheMatrix 

cacheSolve <- function(x, ...) {
  #checks the stored value of 'invert' and if it is a matrix, returns it
  invert <- x$getinvert()
  if(!is.null(invert)) {
    message("getting cached data")
    return(invert)
  }
  #if 'invert' was empty the function inverts the original matrix
  data <- x$get()
  invert <- solve(data, ...)
  #it then stores the inverted matrix to be called later
  x$setinvert(invert)
  invert}

