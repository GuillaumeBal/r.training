rm(list = ls())

wd <- "C:/Users/gbal/Desktop/github.work/r.training/2.data"
setwd(wd)

#library for xlsx file
require(openxlsx)
# library for direchlet distribution
require(gtools)

################## number of  years ######################################

year.start <- 2000
year.end <- 2017
n.years <- year.end - year.start + 1

################# abundance wild fish, decreasing with time ################
### decreasing abundance throug time with noise

wild.abundances <- ceiling(1000 - seq(from = 0, to = 300, length.out = n.years) + rnorm(n = n.years, mean = 0, sd = 100))
plot(wild.abundances)

################### ranched fish abundance ##################### 
### 1.5 times more ranched than wild in average

ranched.abundances <- ceiling(wild.abundances * rnorm(n = n.years, mean = 1.5, sd = .15))
plot(wild.abundances, ranched.abundances)
curve(1 * x, col = 'grey', add = T)

#################  main structure of the data table ###########
### columns of the table

salmons.var <- c('year',
                 'julian.day',
                 'wild',
                 'river.age',
                 'sea.age',
                 'length', 
                 'weight',
                 'sea.lice')

salmons <- matrix(nrow = sum(c(wild.abundances, ranched.abundances)), ncol = length(salmons.var),
                  dimnames = list(NULL,
                                  salmons.var))
salmons <- as.data.frame(salmons)

dim(salmons)
head(salmons)

############# ranched an wild fish ##################

salmons$wild <- c(rep(1, sum(wild.abundances)), rep(2, sum(ranched.abundances))) 
table(salmons$wild)

############## year capture ##########################

salmons$year <- c(rep(year.start:year.end, times = wild.abundances),
                        rep(year.start:year.end, times = ranched.abundances))
hist(salmons$year)

############# salmon sea age #########################
### no difference between ranched and wild

#salmons$sea.age <- sample(size = dim(salmons)[1], x = 1:4, prob = c(0.6, 0.25, 0.10, 0.05), replace = T)

prob.ages.year <- matrix(nrow = n.years, ncol = 4)

for (j in 1:n.years){
  prob.ages.year[j , ] <- c(64 * (1 + .15 * (j - 1)), 
                             128, 
                             32, 
                             16)
}

#rdirichlet(1, prob.ages.year[n.years, ])

plot(prob.ages.year[ , 1])

for (i in 1:dim(salmons)[1]){
  salmons$sea.age[i] <- sample(size = 1, x = 1:4, 
                                   prob = rdirichlet(1, alpha = prob.ages.year[salmons$year[i] - min(salmons$year) + 1, ]),
                                   replace = T)
}

hist(salmons$sea.age)

############# salmon river age #######################
### wild smolt olders

wild.row.max <- max(which(salmons$wild == 1))

salmons$river.age[1:wild.row.max] <- sample(size = wild.row.max, x = 1:3, prob = c(0.4, 0.5, 0.10), replace = T)
salmons$river.age[(wild.row.max + 1):dim(salmons)[1]] <- sample(size = dim(salmons)[1] - wild.row.max, x = 1:3, prob = c(0.8, .19, 0.01), replace = T)

hist(salmons$river.age ~ salmons$wild )  

################ day capture  ##########################
### age  + wild effect

salmons$julian.day <- 90 + 
  (salmons$sea.age == 1) * 50 +
  (salmons$year - min(1 * salmons$year)) +
  (salmons$wild == 2) * 15 +
  rnorm(dim(salmons)[1], 0, 10)
hist(salmons$julian.day)

################# sex   ##############################
### more males in 1 SW

sw1 <- which(salmons$sea.age == 1)
swm <- which(salmons$sea.age != 1)
salmons$sex[sw1] <- sample (size = length(sw1), x = 1:2, prob = c(65, 35), replace = T)
salmons$sex[swm] <- sample (size = length(swm), x = 1:2, prob = c(20, 80), replace = T)

################ length ##############################
### effect of age + wild 

salmons$length <- 65 +
  15 * (salmons$sea.age - 1) -
  .3 * (salmons$year - year.start - 1) +
  0.02 *  salmons$julian.day +
  5 * salmons$wild+
  rnorm(dim(salmons)[1], mean = 0, sd = 5 * (1 + (salmons$sea.age - 1) / 4)) 
salmons$length <- salmons$length
hist(salmons$length)

################ weight ##############################
### wild fish plumper

salmons$weight <- exp(-5  +  3 * log(salmons$length) + rnorm(dim(salmons)[1], 0, .1)) / 1000
salmons$weight <- round(salmons$weight, 2)
hist(salmons$weight)
plot( salmons$length, salmons$weight, col = salmons$wild)

######################################################
### sea lice infection logit age

salmons$sea.lice <- inv.logit( -2 + 0.075 * (salmons$length - mean(salmons$length)) + rnorm(dim(salmons)[1], 0, .2))
salmons$sea.lice <- rbinom(n = dim(salmons)[1], size = 1 ,  prob = salmons$sea.lice)
plot(salmons$length, salmons$sea.lice)


#####################################################
### add river name

rivers.names <- c('corrib', 'moy', 'oir', 'scorff', 'nivelle')
salmons$river <- as.factor(rivers.names[n = sample(dim(salmons)[1], x = 1:5, replace = T)])
summary(salmons)

#####################################################
### add NA in data

n.na <- 300

na.rows <- sample(size = n.na, x = 1:dim(salmons)[1], replace = F)
na.cols <- sample(size = n.na, x = 1:dim(salmons)[2], replace = T)

for (i in 1: n.na) salmons[na.rows[i], na.cols[i]] <- NA


#####################################################
### day outliers

salmons$julian.day[sample(size = 500, x = 1:dim(salmons)[1], replace = F)] <- sample(size = 50, x = 367:450, replace = T)

#####################################################
### weight outliers, conversion issue
weight.conv.issue <- sample(size = 500, x = 367:450, replace = T)
salmons$weight[weight.conv.issue ] <- salmons$weight[weight.conv.issue ] * 1000

#####################################################
###length outliers, conversion issue inches
length.conv.issue <- sample(size = 500, x = 367:450, replace = T)
salmons$length[length.conv.issue ] <- salmons$length[length.conv.issue ] / 2.54

####################################################
#### infected as true or false
salmons$sea.lice <- as.logical(salmons$sea.lice)

####################################################
#### break lines order
salmons <- salmons[sample(size = dim(salmons)[1] , x = 1:dim(salmons)[1], replace = F), ]

######################################################
### write.table

write.table(salmons, file = 'salmon.data.raw.txt', sep =',', dec = '.', row.names = F)
write.table(salmons, file = 'salmon.data.raw.2.txt', sep =';', dec = ',', row.names = F)
write.xlsx(salmons, file = 'salmon.data.raw.xlsx')