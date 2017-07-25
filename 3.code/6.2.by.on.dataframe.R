# load salmon data and check object dimensions

rm(list = ls()) # clean environment

# modify working directory
wd <- "C:/Users/gbal/Desktop/r.training/2.data"
setwd(wd)

# read salmon data
#salmon.data <- read.table('salmon.data.raw.txt', sep = ';', dec = ',', header = TRUE)
salmon.data <- read.table('salmon.data.raw.txt', sep = ',', dec = '.', header = TRUE)
dim(salmon.data)
head(salmon.data)

# change weight in g into kg
salmon.data$weight[salmon.data$weight > 50] <- 
  salmon.data$weight[salmon.data$weight > 50] / 1000

# open new graphic windows
X11(10, 10)

# set graphical parameters
par(mfrow = c(4, 6), mar = c(3, 3, 2, 0.5)+0.1,
    mgp = c(2, 0.8, 0))

# plot lenght weight relationship per year
by(data = salmon.data,
   INDICES = list(salmon.data$year),
   FUN = function(salmon.data){
     plot(x = salmon.data$length,
          y = salmon.data$weight,
          col = "blue", pch = ".",
          main = salmon.data$year[1])
   })

# open new graph windows
X11(10, 10)

# set graphical parameters
par(mfrow = c(4, 6), mar = c(3, 3, 2, 0.5)+0.1,
    mgp = c(2, 0.8, 0))

# plot lenght weight relationship per year with custom titles
by(data = salmon.data,
   INDICES = list(salmon.data$year, salmon.data$sex),
   FUN = function(subSalmon){
     plot(x = subSalmon$length,
          y = subSalmon$weight,
          col = "blue", pch = ".",
          main = paste(subSalmon$year[1], c("F", "M")[subSalmon$sex[1]]))
   })

