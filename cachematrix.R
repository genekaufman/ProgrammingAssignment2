#Gene Kaufman Edited
## Put comments here that give an overall description of what your
## functions do

# this function acts like a class in other languages, 
# but It's actually a list of getter and setter functions 
# The data part of makeCacheMatrix will hold a matrix
# of the cached Solve solutions. 
makeCacheMatrix <- function(x = matrix()) {
	#initialize data
	mdata <- null


	set <- function(y){
		x <<- y
		mdata <<- null
	}
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
