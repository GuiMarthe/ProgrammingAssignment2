## Theese functions are made to invert a matrix and cache its resultss for further, less computationally demanding, use.


## the first function creates a list of 4 functions, for 1) setting the values of matrix to be inveserd, 
## 2) getting the values of matrix when called,  3) setting the inversed matrix, 
## 4) getting the inversed matrix. Since the arguments are set to be cached by the "<<-" operator, 
## the results are computationaly less demanding for later calls.


makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y 
        m <<- NULL
        
    }
    
    get <- function() x 
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
    
}


## the following funtion gets its arguments from the list of functions created by the previous set of code. 
## It first askes to see if the inverse has already been compute and prints if TRUE. 
## Else, it proceeds to calculate the inverse, with the data stored on the list.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data,...)
    x$setinverse(m)
    m
    
    
## Return a matrix that is the inverse of 'x'

}
