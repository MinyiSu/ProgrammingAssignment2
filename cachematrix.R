a pair of functions that cache that inverse of a matrix


this function creats a special "matrix" object that can cache its inverse 

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setInverse <- function(inverse) inv <<- inverse
	getInverse <- function() inv
	list(set = set, 
	     get = get,
	     setInverse = setInverse,
	     getInverse = getInverse)
}


this function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
	inv <- x$getInverse()
	if (!is.null(inv)) {
		message("getting cached data")
		return(inv)
	}
	mat <- x$get()
	inv <- solve(mat, ...)
	x$setInverse(inv)
	inv
}
