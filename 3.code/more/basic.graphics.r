#clear environment
rm(list = ls())

# set working directory
wd <- 'C:/Users/gbal/Desktop/github.work/r.training/3.code'
setwd(wd)


# load salmon .data
salmon <- read.table('salmon.data.raw.txt', sep = ',', dec = '.', h = TRUE)


# multiple plot on panel
#par(mfcol = c(3, 2))

# regular plot =============================================

salmon$weight[!is.na(salmon$weight) & salmon$weight > 50] <- salmon$weight[!is.na(salmon$weight) & salmon$weight > 50] / 1000

salmon$length[!is.na(salmon$length) & salmon$length < 50] <- salmon$length[!is.na(salmon$length) & salmon$length < 50] * 2.54


#plot length vs weight
plot(salmon$length, salmon$weight)

# weight histogram
hist(salmon$weight)

boxplot(salmon$weight ~ salmon$river,
        outline = FALSE,
        ylab = 'Weight (Kg)',
        main = 'Salmon weight per River')


pairs(salmon[ , c(2, 6, 7)])



barplot(table(salmon$sea.age, salmon$river),
        main = 'Number fish per sea age',
        ylab = 'Abundance')

weight.river.year <- by(data = salmon$weight[salmon$sea.age == 1], 
                        INDICES = list(salmon$river[salmon$sea.age == 1], salmon$year[salmon$sea.age == 1]), 
                        FUN = mean, na.rm = TRUE)

weight.river.year <- matrix(unlist(weight.river.year),
                            ncol = length(unique(salmon$river)),
                            nrow = length(unique(salmon$year)),
                            byrow = TRUE)


matplot(t(weight.river.year), type = 'l')
