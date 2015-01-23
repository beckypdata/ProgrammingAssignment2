## Testing functions
## To begin create square matrix
z <- matrix(sample(1:100, 16), 4, 4)

## Now call the constructor for the list needed to contain associated functions
w <- makeCacheMatrix(z)

## Following demonstrates previous matrix referenced now with get function of list
message("Initial matrix")
print(w$get())

## Now calculate the inverse, reference through getinverse function of list
message("Calculated inverse")
zinv <- cacheSolve(w)
print(w$getinverse())

## Now repeat the calculation to demonstrate use of cached inverse
message("Demonstrate use of cached inverse matrix")
zinv <- cacheSolve(w)
print(w$getinverse())

## Following demonstrates accuracy of the calculated inverse with matrix
## multiplication of original matrix and inverse.  Result is identity matrix
message("Demonstrate accuracy of inverse matrix")
epsilon <- 1e-16
print(matrix(as.numeric(sprintf("%.13f", abs(abs(z%*%zinv)-epsilon))),4,4))

## Repeat with matrix 5x5
z <- matrix(sample(1:100, 25), 5, 5)

## Now call the constructor for the list needed to contain associated functions
w <- makeCacheMatrix(z)

## Following demonstrates previous matrix referenced now with get function of list
message("Initial matrix")
print(w$get())

## Now calculate the inverse, reference through getinverse function of list
message("Calculated inverse")
zinv <- cacheSolve(w)
print(w$getinverse())

## Now repeat the calculation to demonstrate use of cached inverse
message("Demonstrate use of cached inverse matrix")
zinv <- cacheSolve(w)
print(w$getinverse())

## Following demonstrates accuracy of the calculated inverse with matrix
## multiplication of original matrix and inverse.  Result is identity matrix
message("Demonstrate accuracy of inverse matrix")
print(matrix(as.numeric(sprintf("%.14f", abs(abs(z%*%zinv)-epsilon))),5,5))