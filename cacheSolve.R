# This function computes the inverse of the special "matrix" returned by makeCacheMatrix
#
# If the inverse has already been calculated (and the matrix has not changed), then 
# cachesolve will retrieve the inverse from the cache.
#
# Brian Buckley September 2014
#
cacheSolve <- function(x, ...) {
    
    # Check if we have a value for the inverse of x in the cache
    # by calling the getsolve() function from makeCacheMatrix on our special input
    # matrix x
    inv <- x$getsolve()
    if(!is.null(inv)) {
        message("returning cached inverse matrix")
        return(inv)
    }
    
    # If we have no cached value we will use R solve() to calculate the value
    # and we will store the value in the cache prior to returning by calling
    # the setsolve() function from makeCacheMatrix
    data <- x$get()
    inv <- solve(data, ...)
    x$setsolve(inv)
    
    message("returning calculated inverse matrix - now cached")
    inv
}