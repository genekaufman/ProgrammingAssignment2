# this function acts like a class in other languages, 
# but It's actually a list of getter and setter functions 
# The data part of makeCacheMatrix will hold a matrix
# of the cached inverted matrix. 
makeCacheMatrix <- function(x = matrix()) {
	# inverseMatrix is the matrix's Solve Value
	inverseMatrix <- NULL

	#initialize/reset data elements
	# inverseMatrix hasn't been determined yet for this new matrix, so nullify any existing one
	set <- function(y){
		# Set the Matrix, make sure the inverseMatrix is wiped out
		x <<- y
		inverseMatrix <<- NULL
	}

	# return the current matrix
	get <- function() x

	# determine and store the inverse matrix for this matrix
  	setinverse <- function(solve) inverseMatrix <<- solve

  	# return the current inverse matrix
  	getinverse <- function() inverseMatrix

  	# make these functions available in a list
  	list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# wrapper for makeCacheMatrix that allows us to take in a matrix and determine if 
# we've already determined its inverse. 
# If so, just return the cached inverse matrix; 
# else, execute Solve for this matrix and cache the result
cacheSolve <- function(x, ...) {	
	#In this function, x is a makeCacheMatrix object.

	#first, let's see if there's an inverse matrix for this matrix
	inverseMatrix <- x$getinverse()

	# if it's not null then we're using the cached value
	if(!is.null(inverseMatrix)) {
		message("getting cached data")
		return (inverseMatrix)
	}

	# if we're to this point then the inverseMatrix WAS null, and we still need 
	# to call solve and cache the value

	data <- x$get() # pull the matrix into the data variable
	inverseMatrix <- solve(data, ...) # execute solve for this matrix
	x$setinverse(inverseMatrix) # cache this one
	inverseMatrix # return the newly-determined inverseMatrix	

}


# how to test it
#
# a<-makeCacheMatrix(matrix(c(1,5,7,33),3,3))
# cacheSolve(a) # will call solve() and cache the result
# cacheSolve(a) # will return the cached result without calling solve()
# a$set(matrix(c(4,7,9,2),2,2)) # change the matrix and clear out the cached inverse matrix
# cacheSolve(a) # will call solve() and cache the result
# cacheSolve(a) # will return the cached result without calling solve()
