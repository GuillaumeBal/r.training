dim(salmon.data)


ncol(salmon.data)
dim(salmon.data)[2]

# this a loop make an histogram of salmon data columnd 
#if they are numeric or integer
for(cnum in 1:dim(salmon.data)[2]){
#c <- 1
  test_hist <- is.numeric(salmon.data[ , cnum])|is.integer(salmon.data[ , cnum])
  if(test_hist){
    hist(salmon.data[ , cnum], main = colnames(salmon.data)[cnum] )
  }else{
    print(paste('not numeric or integer', colnames(salmon.data)[cnum]))
  }
}
