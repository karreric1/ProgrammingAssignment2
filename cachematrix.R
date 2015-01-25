## These two functions will compute the inverse of a matrix.  If the matrix has already been calculated and the values do not
#change, a cached copy will be called to speed up calculation time.

## Some code for these functions were provided by R. Peng of Johns Hopkins University

## The makeCacheMatrix function caches an inverse of a matrix and has one argument, x

makeCacheMatrix <- function(x = matrix()) {##name function and assign arguments
        i <- NULL
        set <- funciton(y) { ##sets values for a matrix 
                x <<- y
                i <<- NULL
        }
        get <- function () x  ##gets values for a matrix
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set,get = get, setinverse = setinverse, getinverse = getinverse)


}


## The cacheSolve function computes the inverse of a matrix returned by makeCacheMatrix, has one argument, x 
##and passes variables through if needed.

cacheSolve <- function(x, ...) { ##name function and assign arguments
        ## Return a matrix that is the inverse of 'x'
        i <- x$inverse()  ##get inverse from list 
        if(!is.null(i)) {  ##this if statement checks for presence of cached data
                message("getting cached data")
                return(i)  ##returns cached data if present
        }
        data <- x$get()
        i <- solve(x)%*%x ##calculates inverse of matrix x
        x$setinverse(i)
        i  ## returns inverse of matrix
}

