###############
## 2.1 Vectors:
###############

## =======================
## Exercises 2.1-1

## 1) Create a vector 'a' containing the values 
##    10, 5, 4.1 and 100. (function c)

a <- c(10, 5, 4.1, 100)
a

## 2) Which is its class? Its mode?

class(a)
mode(a)

## 3) Add 2 to each element of a.

a + c(2, 2, 2, 2)
a + 2

## 4) Calculate its log in base 10 (use the help if needed).

?log
log(x = a, base = 10)
log10(x = a)

## 5) Create a vector of two elements with today and 
##    yesterday's date (use Sys.Date)

Sys.Date()
as.numeric(Sys.Date())

Sys.Date() - 1

c(Sys.Date(), Sys.Date() - 1)

Sys.Date() - c(0, 1)

## =======================
## Exercises 2.1-2

## 1) Create a random vector "x" of length 10, with values
##    comprised between 0 and 10 (function runif(.), use the help).
x <- runif(n = 10, min = 0, max = 10)
x

## 2) Which elements of this vector are greater than 5?

## 2.1) Write and store the test
x > 5

test5 <- x > 5

## 2.2) Use which
which(test5)

which(x > 5)


## 3) Test if sqrt(x)^2 equals x in all cases.
sqrt(x)^2 == x

all.equal(sqrt(x)^2, x)


## !!! if one = omitted
# sqrt(x)^2 = x
# 
# x = sqrt(x)^2

## 4) Same for sqrt(x^2)
sqrt(x^2) == x

## 5) (optional) Can you show that sqrt(x)^2 equals
##    x ± the machine precision 
##    (use sqrt(.Machine$double.eps) as precision)?

## =======================
## Exercises 2.1-3

## 1) Test if sqrt(x)^2 equals x in all cases (alternative method).
sqrt(x)^2 == x
all(sqrt(x)^2 == x)
all(sqrt(x^2) == x)

## 2) Which elements of x are greater than 8 or less than 4?
x > 8
x < 4

x > 8 | x < 4

which(x > 8 | x < 4)

test <- x > 8 | x < 4
which(test)

## 3) Which elements have values between 4 and 8 ?
! test
which(! test)

which(x > 4 & x < 8)

## 4) Extract elements of the vector 
##    setLet <- c("A", "b", "Z", "g", "J") 
##    which are small caps (reference: predefined vector letters).

setLet <- c("A", "b", "Z", "g", "J")
letters

is.element(setLet, letters)
setLet %in% letters

which(setLet %in% letters)
