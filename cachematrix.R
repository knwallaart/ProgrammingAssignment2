

## The following function creates a special "matrix" object that can cache its inverse. 
##  MakeCasheMatrix creates a list containing a function that sets the value of the vector, 
##   gets the value of the vector, sets the value of the inverse of the matrix, and gets the value of the inverse. 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function (y) {
            x <<- y
            m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## The following function computes the inverse of the special "matrix" returned by the function
##   makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed),
##    then cacheSolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}









