

# FUNCTION 1: The following function creates a special "matrix" object that can cache its inverse. 
#  MakeCasheMatrix creates a list containing a function that sets the value of the vector, 
#   gets the value of the vector, sets the values of the inversed matrix, and gets the values of the inversed matrix. 

makeCacheMatrix <- function( x = matrix() ) {        # call as my_cached_matrix <- makeCacheMatrix(my_regular_matrix)
    inverse_matrix <<- NULL		# Start off with an empty inverseMatrix. I put <<- instead of <- from the example. I think that is an error.
    set <- function( y ) {			# Function declaration. Does not do anything until called, then stores the matrix passed as y in the persistent matrix variable x
        x <<- y
        inverse_matrix <<- NULL   
    }
    get <- function() {			# Function declaration. Does not do anything until called, then returns the persistent matrix variable x
        x   
    }
    setInverse <- function(inverse) {	# Function declaration. Does not do anything until called, then stores the inverse matrix passed ..
                                        # .. as inverse in the persistent inverse matrix variable inverse_matrix. It does NOT calculate the inverse matrix itself.
        inverse_matrix <<- inverse	   
    }
    getInverse <- function() {			# Function declaration. Does not do anything until called, then returns the persistent inverse matrix variable
        inverse_matrix  
    }
    list(  set = set, get = get,		# returns the above declared list of functions, since this is the last statement in the function declaration
           setInverse = setInverse,
           getInverse = getInverse )   
}
}


# FUNCTION 2: The following function computes the inverse of the special "matrix" returned by the function
#   makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed),
#    then cacheSolve retrieves the inverse from the cache.


cacheSolve <- function(cached_matrix, ... ) {
    
    inverse_matrix <- cached_matrix$getinverse() # Puts the persistent inverse matrix in a local function var inverse_matrix
    
    if(!is.null(inverse_matrix)) {         # This checks if persistent inverse matrix is not NULL. If so it was already calculated/cached before and the cached one is returned
        message("getting cached data") 
        return(inverse_matrix)			# This returns from the function.
    }
    
    # You only get here if the inverse matrix is still NULL so then you calculate the inverse:
    
    inverse_matrix <- solve(cached_matrix$get())	# calculate inverse matrix
    cached_matrix$setinverse(inverse_matrix)		# and store to persist
    inverse_matrix								# and return the inverse matrix
}
}









