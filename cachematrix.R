# The objective is to calculate the inverse of a matrix. However, we don't
## want to calculate the same matrix; instead we will store the matrx and, if
## the function detects that it is the same matrix as before, it will return
## the result again.

## makeCacheMatrix function creates a special "matrix" object that can cache its
## inverse. It will create a list that will contain results from a function that
## set & get the values of a matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinv <- function(inv) m <<- inv
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)

}


## cacheSolve will calculate the inverse of a matrix. If that matrix is cached
## from the above makeCacheMatrix function, it will return that result instead
## of recalculating it again.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinv(m)
    m
}
