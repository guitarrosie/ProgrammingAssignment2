## This file contains functions that cache a matrix and its inverse


## Caches the specified (invertible) matrix and returns a list of
## functions that get/set a matrix and return its inverse

## 'x' is an invertible matrix which inverse needs to be calculated for

## Returns a list of functions for manipulating the cache:
##     get - gets the cached matrix
##     set - sets the new cached matrix
##     solve - returns the inverse of the cached matrix
makeCacheMatrix <- function(x = matrix()) {
    xInverse <- NULL
    
    get <- function() x
    set <- function(y) {
        x <<- y
        xInverse <<- NULL
    }
    
    cacheSolve <- function() {
        if (!is.null(xInverse)) {
            message("getting cached data")
            
            return(xInverse)
        }
        
        xInverse <<- solve(x)
        xInverse
    }
    
    list(set = set, get = get, solve = cacheSolve)
}


## Returns the inverse of a matrix cached using makeCacheMatrix

## 'x' is a list of functions returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
    x$solve()
}
