## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The function is intended to return a list of functions that operate on a matrix
## It will set the value of a matrix
## it will retrieve the value of a matrix
## it will set value of inverse of a given matrix
## it will retrieve the value of inverse of a given matrix
 makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x<<-y
    invmatrix <<- NULL ## this will set the variable NULL thru all the parent env
  } ## end of set function
  get <- function() x
  setinverse <- function(inv) invmatrix <<-inv ## will set the variable to the inverse value thru parent envs
  getinverse <- function() invmatrix
  list(set=set,                get=get, 
       setinverse=setinverse, getinverse=getinverse)
  
} ## end of makeMatrix function


## Write a short comment describing this function
## Assuming the matrix is reversible
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse<-x$getinverse()
        ## testing to see if it was already computed and stored in any parent env.
        if(!is.null(inverse)){
          message("getting cached data")
          return(inverse)  ## function will return and not execute further
        }
        origMatrix<-x$get() ## this is by default the 'else' part where we get orginal matrix
        inverse<-solve(origMatrix) ## compute the inverser of the original matrix
        x$setinverse(inverse) ## store inverse in cache/parent environment
}## end of cacheSolve
