## Put comments here that give an overall description of what your
## functions do

## I am going to create the function makeCacheMatrix that once passed 
## a certain matrix x will extract a list containing 4 functions:

## 1.Function that set the value of the matrix
## 2.Function that get the value of the matrix
## 3.Function that set the value of the inverse of the matrix
## 4.Function that get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {  
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinversion <- function(solve) m <<- solve
    getinversion <- function() m
    list(set = set, get = get,
         setinversion = setinversion,
         getinversion = getinversion)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    m <- x$getinversion()
    if(!is.null(m)) {
        message("getting inverse matrix")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinversion(m)
    m
    
    ## Return a matrix that is the inverse of 'x'
}    



#Functions check 

A<-matrix(c(4,7,2,6),nrow=2,ncol=2,byrow=T)   
aVector <- makeCacheMatrix(A)


aVector$get()               # retrieve the value of the "x" matrix 
aVector$getinversion()      # retrieve the value of m, which should be NULL
cacheSolve(aVector)         # notice mean calculated is mean of 30:50, not 1:10
aVector$getinversion()      # retrieve it directly, now that it has been cached















