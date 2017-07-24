# load salmon data and check object dimensions
salmon.data <- read.table('N:/0_r_training/2_data/salmonRaw.txt', header = TRUE)
dim(salmon.data)

head(salmon.data)

X11(10, 10)
par(mfrow = c(4, 6), mar = c(3, 3, 2, 0.5)+0.1,
    mgp = c(2, 0.8, 0))
by(data = salmon.data,
   INDICES = list(salmon.data$year),
   FUN = function(subSalmon){
     plot(x = subSalmon$length,
          y = subSalmon$weight,
          col = "blue", pch = ".",
          main = subSalmon$year[1])
   })

X11(10, 10)
par(mfrow = c(7, 6), mar = c(3, 3, 2, 0.5)+0.1,
    mgp = c(2, 0.8, 0))

by(data = salmon.data,
   INDICES = list(salmon.data$year, salmon.data$sex),
   FUN = function(subSalmon){
     plot(x = subSalmon$length,
          y = subSalmon$weight,
          col = "blue", pch = ".",
          main = paste(subSalmon$year[1], c("F", "M")[subSalmon$sex[1]]))
   })

