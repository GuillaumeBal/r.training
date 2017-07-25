# basic coding

my.function <- function(variable){
  'instructions' # what it does
  return(something) # what is reurns
}


# function computing the mean of vector ====================================

mean.vector <- function(vec){
  # if vec is a vector, returns its mean
  #if(is.vector(vec)){
    sum.vec <- sum(vec)
    length.vec <- length(vec)
    return(sum.vec / length.vec)
  #}else{ # if vec is not a vector print error message
  #  print('Vec is not a vector')
 # }
}


my.vector <- rbind(1:4, 1:4)
#my.vector <- 1:4

mean.vector(my.vector)

# check a few thing about a function ===============================

# get list of arguments
formals(mean.vector)

# get core of the function
body(mean.vector)

# know where its is stored
environment(mean.vector)