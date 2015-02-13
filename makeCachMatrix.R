# This function creates a special "matrix" object that can cache its inverse.
#
# Computing the inverse of a square matrix can be done with the solve function in R. 
# For example, if X is a square invertible matrix, then solve(X) returns its inverse.
#
# Note: We assume that the matrix supplied is always invertible
#
# Brian Buckley September 2014
#
makeCacheMatrix <- function(x = numeric()) {
    
    # Initialize the return inverse matrix value to NULL
    inv <- NULL
    
    # Set the value of the input matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    # Get the value of the input matrix
    get <- function() x
    
    # Set the inverse of the matrix using the R solve() function
    setsolve <- function(solve) inv <<- solve
    
    # Get the value of the inverse matrix
    getsolve <- function() inv
    
    # This is the list of functions for makeCacheMatrix()
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}