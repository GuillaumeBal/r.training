## Embeded loops:
mymat <- matrix(nrow = 5, ncol = 5) # create a 5 x 5 matrix

for(i in 1:nrow(mymat)){  # for each row
  for(j in 1:ncol(mymat)){ # for each column
    
    ## Just printing some information:
    Sys.sleep(2)
    cat("\014")
    message("\ni = ", i, "\nj = ", j, "\ni * j = ", i * j, "\n")
    
    mymat[i, j] <-  i * j # assign values based on position: product of two indexes
    
    ## Printing the result:
    print(mymat)
  }  
}

### Next
mymat <- matrix(nrow = 5, ncol = 5) # create a 5 x 5 matrix

for(i in 1:nrow(mymat)){  # for each row
  for(j in 1:ncol(mymat)){ # for each column
    
    Sys.sleep(1)
    cat("\014")
    message("\ni = ", i, "\nj = ", j, "\ni * j = ", i * j, "\n")
    
    
    if((i * j > 7) && (i * j < 14)) {
      print(mymat)
      next()  ## jumps to next iteration
    }
    
    mymat[i, j] <-  i * j # assign values based on position: product of two indexes
    print(mymat)
  }  
}

### Next is optional... you can use a else block instead:
mymat <- matrix(nrow = 5, ncol = 5) # create a 5 x 5 matrix

for(i in 1:nrow(mymat)){  # for each row
  for(j in 1:ncol(mymat)){ # for each column
    
    Sys.sleep(1)
    cat("\014")
    message("\ni = ", i, "\nj = ", j, "\ni * j = ", i * j, "\n")
    
    
    if((i * j > 7) && (i * j < 14)) {
      print(mymat)
      ## next()  ## No need for a next, what's next 
                 ## (else block) is only evaluated if condition is FALSE
    }else{
      mymat[i, j] <-  i * j # assign values based on position: product of two indexes
      print(mymat)
    }
  }  
}


### break:
mymat <- matrix(nrow = 5, ncol = 5) # create a 5 x 5 matrix

for(i in 1:nrow(mymat)){  # for each row
  for(j in 1:ncol(mymat)){ # for each column
    
    Sys.sleep(0.8)
    cat("\014")
    message("\ni = ", i, "\nj = ", j, "\ni * j = ", i * j, "\n")
    
    if((i * j > 7) && (i * j < 14)) {
      print(mymat)
      break()  ## Stops the current loop (over values of j)! 
               ## => jumps directly to the next row.
    }
    
    mymat[i, j] <-  i * j # assign values based on position: product of two indexes
    print(mymat)
    
  }  
}

