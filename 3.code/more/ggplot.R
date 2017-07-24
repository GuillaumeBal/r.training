###-------------------------------------------------------
### openxlsx package
###-------------------------------------------------------

### read data
data.salmon <- read.table('salmonRaw.txt', h = T)

###-------------------------------------------------------
### ggplot2
###-------------------------------------------------------

require(ggplot2)

# regular plot of weight vs day, colour different per river
ggplot(data.salmon, aes(x = julian_day, y = weight)) + 
  geom_point(aes(colour = river))

# regular plot of weight vs day, colour shades of blue
ggplot(data.salmon, aes(x = julian_day, y = weight)) + 
  geom_point(aes(colour = as.numeric(river))) +
  scale_colour_gradient(low = "blue")

# select corrib fish under 20kg
data.salmon.sub <- data.salmon[data.salmon$river == 'corrib' & data.salmon$weight < 20, ]

# regular plot of weight for Corrib River, smoothing added
ggplot(data.salmon.sub, 
       aes(x = length, y = weight)) +
  geom_point() +
  geom_smooth()

# regular plot of weight, 
# one panel per river,
# different color per river, smoothing
ggplot(data.salmon[data.salmon$weight < 20, ], 
       aes(x = length, y = weight)) +
  geom_point(aes(colour = river, show.legend = F)) +
  geom_smooth() +
  facet_grid(~ river) 

# boxplot of weight, river as factor
ggplot(data.salmon[data.salmon$weight < 20, ], 
       aes(x = length, y = weight)) +
  geom_boxplot(aes(river, colour = river))

# boxplot of weight, river and sex as factors
ggplot(data.salmon[data.salmon$weight < 20, ],
       aes(x = length, y = weight)) +
  geom_boxplot(aes(interaction(river, sex)))

###--------------------------------------------------------
### functions examples
###--------------------------------------------------------



