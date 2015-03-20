## These two functions are here to test assgning objects 
## in a different environment in order to cache some
## computationally-expensive values

## First one constructsts a "matrix" object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    ## Initialize the inverse matrix
    inv <- NULL
    ## Set matrix
    set <- function (input) {
        matr <<- input
        inv <<- NULL
    }
    ## Get the matrix
    get <- function() matr
    ## Set the inverse
    setinv <- function (inverse) inv <<- inverse
    ## Get the inverse value
    getinv <- function () inv
    ## Return a list of functions
    list (set=set, get=get, setinv=setinv, getinv=getinv)
}


## The second  one calculates the inverse or takes it
## from cache (if available)

cacheSolve <- function(x, ...) {
    ## Get inverse, see if it actually exitsts
    inv <- x$getinv()
    if (!is.null(inv)) {
        ## If inverse exists, get it
        message("getting cache data, hooray!")
        return (inv)
    }
    ## If inverse doesn't exist, calculate it
    data <- x$get()
    inv <- solve (data, ...)
    x$setinv(inv)
    inv
}
