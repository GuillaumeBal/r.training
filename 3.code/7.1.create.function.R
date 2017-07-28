rm(list = ls())

# basic coding

#my.function <- function(variable){
#  'instructions' # what it does
#  return(something) # what is reurns
#}

source('./3.code/mean.vector.function.r')

# function computing the mean of vector ====================================

mean.vector <- function(vec, na.rm = FALSE){
  # if vec is a vector, returns its mean
  if(is.vector(vec)){
    sum.vec <- sum(vec, na.rm = na.rm)
    ## length.vec <- length(vec)
    length.vec <- sum(! is.na(vec))
    return(sum.vec / length.vec)
  }else{ # if vec is not a vector print error message
    print('Vec is not a vector')
 }
}


my.matrix <- rbind(1:4, 1:4)
my.vector <- c(1:4, NA)

mean.vector(my.vector)
mean.vector(my.vector, na.rm = TRUE)
mean.vector(my.matrix)

# check a few thing about a function ===============================

# get list of arguments
formals(mean.vector)

# get core of the function
body(mean.vector)

# know where its is stored
environment(mean.vector)