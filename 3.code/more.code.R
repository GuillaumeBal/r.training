##################################################################
### use apply, lapply, sapply, tapply and by
####################################################################

#####################
### create some data

### a data frame

my.data.frame <- as.data.frame(matrix(sample(size = 500, x = 1:10, replace = T),
                                      ncol = 5)
)

colnames(my.data.frame) <- letters[1:dim(my.data.frame)[2]]

### a vector

my.vector <- my.data.frame[, 1]

### a list

my.list <- as.list(c(my.data.frame, my.data.frame, my.data.frame))


### apply

mean(my.data.frame[, 1])
mean(my.data.frame[, 2])

mean.colums.df <- apply(my.data.frame, MARGIN = 2,
                        FUN = mean)

apply(my.data.frame, MARGIN = 2,
      FUN = quantile, probs = c(0.20, 0.45, 0.65))

### lapply and sapply

lapply(my.list, FUN = mean)

sapply(my.list, FUN = sd)    

### tapply and by

# add variable of class factor to my.data.frame
my.data.frame$fac1 <- sample(size = dim(my.data.frame)[1], 
                             c('level1', 'level2'), replace = TRUE)
my.data.frame$fac1 <- as.factor(my.data.frame$fac1)

# add second variable of class factor to my.data.frame
my.data.frame$fac2 <- sample(size = dim(my.data.frame)[1], 
                             c('factor1', 'factor2'), replace = TRUE)
my.data.frame$fac2 <- as.factor(my.data.frame$fac2)

# use by
by(data = my.data.frame$a, 
   INDICES = list(my.data.frame$fac1, my.data.frame$fac2),
   FUN = mean)

# use tapply
tapply(X = my.data.frame$a, 
       INDEX = list(my.data.frame$fac1, my.data.frame$fac2),
       FUN = mean)


########################################################################
###           graphics
#######################################################################

################
### basic graph

plot(x = my.data.frame$a,
     y = my.data.frame$b, 
     col = 'blue', pch = 16, type = 'b',
     xlab = 'A', ylab = 'B', main = 'A Vs B')

######################################
### draw multiple graphics in one panel

par(mfrow = c(2, 3),
    oma = c(6, .5, .5, .5),
    mar = c(.5, .5, .5, 4))

plot(rnorm(n = 10))
plot(rnorm(n = 10))
plot(rnorm(n = 10))
plot(rnorm(n = 10))
plot(rnorm(n = 10))
plot(rnorm(n = 10))

####################
### save a graph

par(mfrow = c(1,1))

pdf(file = 'figure1.pdf',
    width = 4, height = 3,
    useDingbats = F)
# sizes are specific to function, pixels, inches...
# useDingbats = F, argument specif to pdf,
# it avoid display issues

plot(rnorm(n = 10))

dev.off()

##################
### a bit of a fancy plot

par(mfrow = c(1,1))

# generate trend data to plot
n.points <- 100
data.to.plot <- rnorm(n = n.points, 
                      mean = seq(0, by = 1, length.out = n.points),
                      sd = 5)

# plot without axes details
plot(data.to.plot, 
     pch = 16, col = 'green',
     axes = FALSE,
     xlab ='', ylab = '')

# create axis
axis(1, at = seq(0, 100, 10), cex.axis = 1.5)
axis(2, at = seq(0, 100, 20), cex.axis = .5)

# create axes labels
mtext(side = 1, line = 3, 'X', cex = 3)
mtext(side = 2, line = 1.5, 'X', cex = 2)

# add a curve
curve(1 * x, add = TRUE, col = 'blue', lwd = 2)

# add legend
legend( x = 'topleft',
        legend = 'Regression line',
        lty = 1,
        col = 'blue',
        bty = 'n')

# add tenxt in the middle of the lot
text(x = 50, y = 60, label = 'FAKE', cex = 5, col = 'red') 



##########################################################################
###                         loops
##########################################################################

### for loop
for(i in 1:10){
  print(paste('row' , i,  sep = ''))
}
print(i)


### while loop
start.time <- Sys.time()
delay <- 0
n <- 0
while(delay < 10){
  n <- n + 1
  delay <- as.numeric(difftime(Sys.time(),  start.time, units = 's'))
}
print(n)

### nested for loops: multiplication table

mymat <- matrix(nrow = 20, ncol = 20) # create a 20 x 20 matrix

for(i in 1:dim(mymat)[1]){  # for each row
  for(j in 1:dim(mymat)[2]){ # for each column
    mymat[i, j] = i * j # assign values based on position: product of two indexes
  }
}

print(mymat)


### nested for and if loops : multiplication table

mymat <- matrix(nrow = 20, ncol = 20) # create a 20 x 20 matrix

for(i in 1:dim(mymat)[1]){  # for each row
  for(j in 1:dim(mymat)[2]){ # for each column
    if(i * j < 20){
      mymat[i, j] = i * j # assign values based on position: product of two indexes
    }else{
      #mymat[i, j] <- 'BIG'  
      #break
      next()  
    }  
  }
}

print(mymat)

########################################################################
###     functions
########################################################################

###########################
### simple function example 

my.function <- function(){
  print(Sys.time())
}

my.function()

###########################
### 'complicated' function drawing a triangle made of stars

stars.triangle <- function (max.stars){
  result <- 0
  for(i in 1:max.stars){
    cat("\n", rep("*", i))
    result <- result + i
  }
  return(result)
}

stars.triangle(10)



