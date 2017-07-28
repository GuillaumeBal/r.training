mean.vector <- function(vec){
  # if vec is a vector, returns its mean
  if(is.vector(vec)){
    sum.vec <- sum(vec)
    length.vec <- length(vec)
    return(sum.vec / length.vec)
  }else{ # if vec is not a vector print error message
    print('Vec is not a vector')
  }
}