dim1 <- 10000000
dim2 <- 100

data.speed.test <- matrix(rnorm(n = dim1 * dim2), nrow = dim1)

system.time({
  dim1.means.1 <- rep(NA, dim1)
  for(a in 1:dim1){
    dim1.means.1[a] <- mean(data.speed.test[a , ])
  }
})

system.time({
    dim1.means.2 <- apply(data.speed.test, 1, mean)
})
