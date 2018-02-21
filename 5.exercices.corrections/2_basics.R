## 2.1.5

## 1)

a <- c(10, 5, 4.1, 100)
a

## 2)

mode(a)
class(a)

## 3)
a + 2

## 4)
?log
log10(a)
log(x = a, base = 10)

## 5)
td <- Sys.Date()
as.integer(Sys.Date())

# Yesterday:
Sys.Date() - 1
yd <- td - 1

# Vector (different ways):
c(Sys.Date(), yd)
c(td, yd)

Sys.Date() - c(0, 1)

as.numeric(Sys.Date() - c(0, 1))

## 2.1.6 - tests

## 1)

?runif
set.seed(12345)  # for reproducibility!
x <- runif(n = 10, min = 0, max = 10)
print(x)

## 2)

## 2.1
testx <- x > 5
print(testx)

## 2.2:
which(testx)

## 3)
sqrt(x)^2 == x
sqrt(x)^2 - x

## x = sqrt(x)^2 ##! double ==

## 4)
sqrt(x^2) == x


## 2.1.7:

## 1)
testsqrt <- sqrt(x)^2 == x
all(testsqrt)

x2 <- runif(n = 10000, min = 0, max = 10)
testsqrt2 <- sqrt(x2^2) == x2
all(testsqrt2)

## 2)
test1 <- x > 8
test2 <- x < 4

testComb <- test1 | test2
(x > 8) | (x < 4)

which(testComb)

## 3)

which((x <= 8) & (x >= 4))
which( ! testComb)

## 4)
setLet <- c("A", "b", "Z", "g", "J")
letters

setLet %in% letters
lower <- is.element(setLet, letters)

which(lower)
which(setLet %in% letters)

## 2.1.9 - sequences/rep:

## 1)

x <- runif(n = 10)

lenx <- length(x)

?seq

seq(from = 2, by = 1, length.out = lenx)
seq(from = 2, by = 1, along.with = x)

1:lenx
(1:lenx) + 1

## 2:
?seq_along
seq_along(x) # not starting at two.

seq_along(x) + 1

## 3:
x
rev(x)

x2 <- rev(x)
x2

## 4:
seq(from = 100, to = 0, by = 5) ## error sign of by
seq(from = 100, to = 0, by = -5)

rev(seq(from = 0, to = 100, by = 5))

(20:0) * 5

20:0 * 5


## 2.1.11 - indexation:

## 1) 
1:5
seq5 <- 2:6
seq5


## 2)
names(seq5)

letters
letters[1:5]
letters[seq5]

names(seq5) <- letters[1:5]
names(seq5)
seq5


## 3)

seq5[c(2, 4)]
seq5[c("b", "d")]

## 4)
idx <- seq5 > 3
idx2 <- which(seq5 > 3)

seq5[idx]
seq5[idx2]

## 5)
seq5
lastElement <- length(seq5)

seq5[lastElement]
seq5[lastElement - 1]


## 6)
size <- rnorm(n = 50, mean = 30, sd = 3)

size >= 33
ixd33 <- which(size >= 33)

length(ixd33)
sum(size >= 33)

## 7)
size[ixd33]

size[ixd33] <- NA
size

# alternative:
size <- replace(size, ixd33, NA)


## 2.2.3 - Other sgtructures:

## 1)

people <- data.frame(name = c("guillaume", "yves", "jack", "maximo", 
                              "hugo", "agnieszka", "anthony", "niamh", 
                              "dave", "michael", "amy", "paul"),
                     surname = c("bal", "reecht", "darcy", "jove", 
                                 "maxwell", "rupnik", "rafferty", 
                                 "slattery", "clarke", "sheridan", 
                                 "fitzpatrick", "coleman"),
                     section = c("feas", "feas", "feas", "osis", "feas", 
                                 "mefss", "osis", "feas", "mefss", "feas", 
                                 "mefss", NA),
                     irish = c(FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE,
                               TRUE, TRUE, TRUE, TRUE, TRUE),
                     age = c(28, 22, 28, 29, 23, 26, 24, 
                             27, 21, 28, 25, 29))

## 2)
print(people)
people
## head(people)

## 3)
ncol(people)
dim(people)[2]

nDims <- dim(people)
nDims[2]

## 4)
nrow(people)

nDims[1]

## 5)

colnames(people)

dimnames(people)[[2]]

people$section
