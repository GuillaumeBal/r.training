## Exercice 2.4

## 1
a <- c(10, 5, 4.1, 100)
print(a)

## 2
mode(a)
class(a)

## 3
log10(a)

## 4
b <- matrix(data = a, nrow = 2)
print(b)

matrix(data = a, nrow = 2, byrow = TRUE)

## 5
nrow(b)

## 6
c(Sys.Date(), Sys.Date() - 1)
Sys.Date() - c(0, 1)

Sys.Date

## Exercise 2.6

## 1
## help.search("uniform distribution")
?runif
x <- runif(n = 10, min = 0, max = 10)
x

x > 5
which(x > 5)

## 3
(x >= 5) & (x <= 8)

sqrt(x)^2 == x
all(sqrt(x)^2 == x)

## 4
abs(sqrt(x)^2 - x) <= sqrt(.Machine$double.eps)
all(abs(sqrt(x)^2 - x) <= sqrt(.Machine$double.eps))

all.equal(x, sqrt(x)^2)

## Exercices 2.8:

## 1:
(lenx <- length(x))

?seq
seq(from = 2, by=1, length.out = length(x))
seq(from = 2, by=1, along.with = x)
seq(from = 2, by=1, length.out = lenx)

2:(length(x) + 1)
(1:length(x)) + 1

## 2
?seq_along
seq_along(along.with = x) + 1


## 3
x2 <- rev(x)
x2
x

## 4
seq(from = 100, to = 0, by = -5)

##################################################
### data loading

salmon.data <- read.table('P:/0_r_training/1_course_v2/2_data/salmonRaw.txt',
                          sep = ' ',
                          header = TRUE)
dim(salmon.data)
head(salmon.data)

### saving data

getwd()

setwd('C:/Users/training1/Desktop/')

write.table(x = salmon.data,
            file = 'salmon.new.txt',
            row.names = FALSE)


#######################################################
## Data manipulation:

## Exercices 3.2

## 1:
seq5 <- 1:5
seq5

## 2
letters
letters[1:5]
letters[seq5]

names(seq5)
names(seq5) <- letters[1:5]
seq5

## 3:
seq5[c(2, 4)]
## seq5[2, 4] # !!!

seq5[c("b", "d")]

seq5[c(FALSE, TRUE, FALSE, TRUE, FALSE)]

## 4:
require(openxlsx)

salmonRaw <- read.xlsx('N:/0_r_training/1_course_v2/2_data/salmonRaw.xlsx', 
                         sheet = 1, colNames = TRUE)

## 4.1
head(salmonRaw)
## salmonRaw[1:10 , , drop = FALSE]
salmonRaw[1:10 , ]

salmonsub10 <- salmonRaw[1:10 , ]
salmonsub10

head(salmonRaw, 10)

## 4.2:
salmonsub10$wild <- NULL
salmonsub10

# dropping columns:
salmonsub10[ , c(-1, -4)]

## 4.3:
salmonsub10$length >= 80
salmonsub10[salmonsub10$length >= 80 , ]


## Exercise 3.5:
salmonRaw <- read.table('P:/0_r_training/1_course_v2/2_data/salmonRaw.txt',
                          sep = ' ',
                          header = TRUE)
head(salmonRaw)

## 1:
class(salmonRaw$river)

## if salmonRaw$river is a character string:
# salmonRaw$river <- factor(salmonRaw$river)

## 2:
head(salmonRaw$river)
levels(salmonRaw$river)

any(is.na(salmonRaw$river))
unique(salmonRaw$river)

## 3:
test <- ((salmonRaw$river == "corrib") | (salmonRaw$river == "scorff")) &
  ! is.na(salmonRaw$river) ## must not be NA !
head(test)

## Better to use tests on sets:
test2 <- is.element(salmonRaw$river, c("corrib", "scorff")) ## OR
test2 <- salmonRaw$river %in% c("corrib", "scorff")
head(test2)

salmonSub <- salmonRaw[test2 , ]
summary(salmonSub)

# order:
salmonSub <- salmonSub[order(salmonSub$river,
                             salmonSub$year) , ]

head(salmonSub)

## 4:
dim(salmonSub)[1]
nrow(salmonSub)

nrow(salmonRaw)

## 5:
?write.table
write.table(x = salmonSub,
            file = "salmonSub.csv", sep = ",", dec = ".", 
            row.names = FALSE)
getwd()

#################################
## 4 data mining exercises

## 1:
salmonTidy <- salmonRaw 

## 2:
summary(salmonTidy)
summary(salmonTidy$weight)

sum(salmonTidy$weight > 120, na.rm = TRUE)

## 2
# Index of misrecorded values
idx <- salmonTidy$weight > 120
sum(is.na(idx))

# to avoid problems with NAs:
idx <- which(salmonTidy$weight > 120)

# misrecorded weights:
salmonTidy$weight[idx]

# ...divide them by 1000:
salmonTidy$weight[idx] <- salmonTidy$weight[idx] / 1000

summary(salmonTidy$weight)

## 3
summary(salmonTidy)

sum(salmonTidy$julian_day > 365, na.rm = TRUE)
sum(is.na(salmonTidy$julian_day))

# Index of kept individuals:
idx2 <- ( ! is.na(salmonTidy$julian_day)) & salmonTidy$julian_day <= 365
# Not kept:
sum( ! idx2)

salmonTidy <- salmonTidy[idx2 , ] 

## Alternative:
salmonTidy <- subset(salmonTidy,
                     ( ! is.na(julian_day)) & julian_day <= 365)

summary(salmonTidy)

## 4
summary(salmonTidy$wild)

# methode 1:
c(TRUE, FALSE)[head(salmonTidy$wild)]

# methode 2 (convert in 0/1, then in logical):
as.logical(2 - head(salmonTidy$wild))

salmonTidy$wild <- as.logical(2 - salmonTidy$wild)

## we check the result:
table(salmonTidy$wild)

## 5:
write.table(x = salmonTidy,
            file = "salmonTidy.csv", sep = ",", dec = ".", 
            row.names = FALSE)

###########################################
### graphics

# plot weight vs length
plot(x = salmonRaw$length,
     y = salmonRaw$weight)

# point location, click on graph
locator(n = 1)

# plot weight vs length
plot(x = salmonRaw$length,
     y = salmonRaw$weight,
     col = c("blue", "red", "green", "orange", "grey")[salmonRaw$river])

levels(salmonRaw$river)

legend('topleft',
       levels(salmonRaw$river),
       pch = rep(16, nlevels(salmonRaw$river)),
       col =c("blue", "red", "green", "orange", "grey"),
       bty = 'n',
       ncol = nlevels(salmonRaw$river))


### include followinf argument into plot function
#xlim = c(min.x, max.x)

