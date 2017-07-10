# load salmon data and check object dimensions
salmon.data <- read.table('N:/0_r_training/2_data/salmonRaw.txt', header = TRUE)
dim(salmon.data)


pairs(salmon.data[1:200 , 1:5])

matplot(salmon.data[1:200 , 1:5], type = 'l')


summary.stuff <- as.vector(by())


for(i in 1:10){
  print(i)
}
