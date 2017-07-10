## ----------------------------
## 2. Basics of the R language:
## ----------------------------

## -----------------------------
## 2.1 Concepts and conventions:

## ---------------
## 2.1.1 Comments:

# I am a comment, I won't be evaluated!

message("Hello ",    # I can also comment the end of a line...
        "World")     # ...even if the instruction isn't completed!

## Note that the former block is strictly equivalent to:

message("Hello ", "World")  # ...so instructions can be splitted
                            # on several lines.

## --------------------------------------
## 2.1.2 Variable declaration/assignment:
myVar <- 1
print(myVar)

## !!!
_myvar <- 2     # a variable name cannot begin with _
1myvar <- 2     # nor a digit.

my_var1 <- 2    # ... but they can be used somewhere else.
my_var1         # Note that when an object is evaluated in the console
                # it is simply printed

## !!! case sensitive:
myvar
myVar

## ----------------------------
## 2.1.3 Invoquing a functions:

rep(x=myVar, times=5)  # using named arguments.
rep(times=5, x=myVar)  # ... the order doesn't matter.

rep(myVar, 5)   # using the order of arguments (risk of error!)
rep(5, myVar)   # !!! to use only with usual functions which have few - surely known - arguments.

## --------------------------------
## 2.1.4 Getting help on functions:
?rep
?mode

help(rep)   # Equivalent to ?rep

## ------------------------
## 2.1.5 Working directory:

getwd()

setwd("")

## -----------------------------------
## 2.2 Types and arrangements of data:
## 2.2.1 Types:

## Numeric (integer and double):
var1.1 <- as.integer(12)
var1.2 <- 3.54

mode(var1.1) ; mode(var1.1)  # ";" used for separating instructions on a same line.

typeof(var1.1)
typeof(var1.2)

## Character
var2 <- "Hello world!"
mode(var2)


""Hello world" again!"
"\"Hello world\" again!"

(var2.1 <- '"Hello world" again!')  # You can use simple quotes as well 
(var2.2 <- "c'est la vie")          # (for including double quotes and vice versa).
                                    # Please note: 
                                    #   * how double quotes *within* the resulting 
                                    #     character string are "escaped" with \.
                                    #   * the use of brackets to force the evaluation of the result.

print('c\'est la vie')    # The escapement of a single quote within single quotes also works.

c("fgrt", 2, 1.1)

## Logical
var3 <- TRUE
mode(var3)

# Interesting facts about logicals:
TRUE <- 1   # TRUE and FALSE are reserved words!

c(T, F)     # They also have shortcuts...

T <- FALSE  # ... which have to be avoided because they aren't reserved words:

c(T, F)

## Complex:
z <- 1 + 2i
mode(z)


## ------------------------------
## 2.2.2 Structures (or classes):

## Vectors:
vect1 <- c(1, 5, 0.23)  # c() concatenate elements in a vector (except when elements are lists).

is.vector(vect1)  # We check that it actually is a vector.
class(vect1)      # the vector being the default structure, class() return the mode

vect1.1 <- c(a = 1, "bb" = 5, 0.23)  # Elements can be named.
vect1.1
names(vect1.1)  # To access the names

# vectors can be of different modes (but only one at the time):
vect2 <- as.character(vect1)

is.vector(vect2)
print(vect2)

c("a", 2, TRUE)      # When differents types are mixed, the concatenation find a possible common
c(TRUE, 0, 2, FALSE) # type through conversion rules (TRUE -> 1, FALSE -> 0 for numeric conv.).

# Note the position of the first element displayed between [] in
# the console at the begining of every printed line:
rep(1:20, 3)

# Initialisation of a vector of a given length (note the default values):
character(3)
integer(5)
logical(2)

(shortVect <- integer(0))
length(shortVect)         # A vector can be of length 0!


## Factors:
fact1 <- factor(c("a", "b", "a", "cd"))

print(fact1)

class(fact1)
typeof(fact1)   # It is however basically an integer vector.
levels(fact1)   # ... with an attribute to name the levels.

as.character(fact1)   # Can be converted in diverse modes (often done implicitly).
as.integer(fact1)

## Dates and Time:
(today <- Sys.Date())
(now <- Sys.time())

mode(today) ; class(today)
mode(now) ; class(now)

as.numeric(today)  # number of days since 01/01/1970
as.numeric(now)    # number of seconds since 101/01/970 00:00:00


## Matrices:
mat1 <- matrix(data = c(1, 2, 3, 4, 5, 6),
               ncol = 2)  # nrow is implicit but could be forced as well (see ?matrix).

print(mat1)
dim(mat1)   # dimensions: 3 rows and 2 columns.


colnames(mat1)
colnames(mat1) <- c("col1", "col2")  # See also row.names()
mat1

## Appending rows/columns
mat2 <- cbind(c(1, 2, 3),   # Binding two (or more) column vectors.
              c(4, 5, 6))
mat2

rbind(mat2,  
      c(7, 8),  # Binding row vectors 
      matrix(c(9, 10, 11, 12), ncol=2)) # (or matrices, provided that they have the same 
                                        # number of columns).

matrix(data = c(1, 2, 3, 4, 5, 6),
       ncol = 2,
       dimnames = list("Indiv"=c("a", "b", "c"),   # Dimensions can be fully named.
                       "vars"=c("var1", "var2"))) 

## Arrays: same as matrix but no limitation in the number of dimensions.
arr1 <- array(data = c(1, 2, 3, 4, 5, 6, 7, 8),
              dim = c(2, 2, 2))  # Dimensions can also be named through a dimnames arg.

arr1

## Lists: the catchall structure!
list1 <- list(c("a", "b"), 
              number = c(1, 8, 14, 0))

list2 <- list(mat = matrix(c(1, 2, 6, 7), nrow=2),
              test=as.logical(c(0, 1, 0)))  # still an example of conversion!

list1
list2

# Concatenation of lists:
listTot <- c(list1, list2,   
             Conversion = c("a character vector implicitly turned to a list",  # Also try to embed
                            "(of character vectors)",                          # this last c(...) in a list().
                            "to make the concatenation possible."))

listTot

## data.frame (~table of data):
dataf <- data.frame(indiv = c("a", "b", "c", "d"), # each column is a vector.
                    value = c(2, 8, 3, 5),
                    treatment = c(FALSE, TRUE))  # vector recycled to match the row number!

print(dataf)

dataf$indiv # column "indiv"... implicitly turned to a factor

## ---------------------------
## 2.3 Vector arithmetic:

myVar <- c(1, 3, 2, 4) + c(0, 10, 20, 30)  # No need for loops!
myVar

c(1, 3, 2, 4) * c(1, 2)    # Notice the repetition of the second vector!
c(1, 3, 2, 4) * c(1, 2, 3) # ... with a warning if not recycled an exact number of times.

# Power:
c(1, 2, 3, 4)^2  # same as c(1, 2, 3, 4)^c(2, 2, 2, 2)

2^c(0, 1, 2, 3)  # same as rep(2, times=4)^c(0, 1, 2, 3)

## Usual arithmetic functions:
sqrt(c(16, 9, 2))

exp(c(0, 1, 2, 3))

log(exp(c(0, 1, 2, 3)))

log10(c(1, 10, 100))

abs(c(-2, 0, 3))

## ---------------------------
## 2.4 Matrix algebra ():
diag(3)
diag(c(2, 1, 4, 3))

mat <- matrix(c(0, 1, 4, 2), ncol=2)  # square matrix.

mat

t(mat)  # Transpose.

solve(mat)  # Inversion.

# (rowvect <- matrix(c(1, 2), nrow=1))
# 
# rowvect %*% mat

mat * mat    # Caution: entry-wise multiplication, not a matrix multiplication

mat %*% mat  # Matrix multiplication.

mat %*% solve(mat)  # Should be the identity matrix as mat is a square nonsingular matrix.

## ---------------------------
## 2.5 Logical operators:
## 2.5.1 Vectorised operators:

cond1 <- c(TRUE, FALSE, FALSE, NA)
cond2 <- c(TRUE, TRUE, FALSE, TRUE)

cond1 & cond2       # Vectorised "AND"
cond1 | cond2       # __________ "OR"
xor(cond1, cond2)   # __________ excl||usive "OR"
!cond1             # __________ "NOT"

## ---------------------------------------
## 2.5.2 Tests among elements of a vector:

all(c(TRUE, TRUE))       # Are all the elements TRUE

all(c(TRUE, FALSE, NA))  # Example of NAs consistency: we can reject the 
                         # "all" condition in the first case...
all(c(TRUE, TRUE, NA))   # we cannot accept it in the second one.

any(c(FALSE, TRUE, FALSE, NA)) # Is at least one element TRUE?

## ---------------------------------------
## 2.5.3 Long - not vectorised - versions:

cond1 && cond2       # Only the first element of each 
cond1 || cond2       # logical vector is used

# Wants to test if a variable exists AND is a data.frame?
# Then compare
exists("dummyVar") & class(dummyVar) == "data.frame"
# and
exists("dummyVar") && class(dummyVar) == "data.frame"
# => second part only evaluated if needed in the long version!

## ---------------------------
## 2.6 Comparisons/test:

## 2.6.1 Comparison operators:

c("a", "b", "c") ==
  c("a", "B", "c")    # remember... R is case sensitive!

c(2, sqrt(3)^2) == c(2, 3)   # Beware of the machine precision ! (this is obviously a wrong outcome)

c(5, 3, 2, 3.01) > 3

Sys.Date() <= c("1916-04-24", "1994-04-05", "2016-03-10")  # Note the automatic conversion... again!
c("1916-04-24", "1994-04-05", "2016-11-10") >= Sys.Date()  # ... which works both ways O_o

## ------------------------------------
## 2.6.2 Testing for indefinite values:

(varnull <- NULL)    # An empty variable.
is.null(varnull)
is.null(cond1)       # A variable which contain something is not null.
is.null(dummyVar)    # but the variable has to exist anyway to be NULL (error otherwise).

is.na(c(-Inf, 500, NA, NaN))
is.nan(c(-Inf, 500, NA, NaN))     # NaN (Not a Number) is a kind of NA, but the inverse is not true.
is.finite(c(-Inf, 500, NA, NaN))
is.infinite(c(-Inf, 500, NA, NaN))

any(is.na(c(-Inf, 500, NA, NaN)))
all(is.na(c(-Inf, 500, NA, NaN)))
## -----------------------------------
## 2.6.3 Sets:

someChar <- c("a", "2", "z", "?")
print(letters)    # letters contains by default the 26 letters of the latin alphabet.

# Which elements of someChar are letters?
is.element(someChar, letters)

someChar %in% letters

which(is.element(someChar, letters))  # which() get the positions of TRUE elements

match(someChar, letters)  # match() get the corresponding positions in the reference set.

## ---------------------------
## 2.8 sequences / Repetions:

## 2.8.1 sequences:

seq(from=0, to=100, by=10)
seq(from=0, by=10, length.out=10)
seq(from=9, by=-3, along.with=c(1, 5, 4, 0))

seq(to=5)  # Guess the default values of other parameters???

# A few shortcuts:
1:10
seq_len(10)   # Sequence starting at 1, with an increment of 1 and of length 10.
seq_along(c(7, 5, 0, 1, 3, 2))  # indices of a vector.
                                # same as seq(from=1, along.with=c(7, 5, 0, 1, 3, 2), by=1)

## Repetitions:
rep(x=1:3, times=2)
rep(x=1:3, each=2)

## Reversing:
rev(1:10)

## -----------------------------------------------------------------------
## 2.9 Mind the precedence of operators (always use brackets if not sure):

# e.g. cubic root:
c(1, 8, 27, 64)^1/3    # Is not what you are looking for (precedence of ^ over /)... but
c(1, 8, 27, 64)^(1/3)  # is the cubic root.

# sequences with ":" are particularly tricky:
# precedence of "^" over ":"
1:4^2
(1:4)^2

# ...but precedence of ":" over "+"
1:4+2
1:(4+2)

??Synthax


if (TRUE || stop("error")) message("All right")
if (FALSE || stop("error")) message("All right")

