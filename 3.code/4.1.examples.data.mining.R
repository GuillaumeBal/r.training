## --------------------
## 4. Data mining in R:
## --------------------

## ------------------------------------------
## 4.1 basic statistics & data visualisation:

# setwd("C:/Users/gbal/Desktop/r.training")
# 
# salmonRaw <- read.table(file="../2.data/salmon.data.raw.txt",
#                         header=TRUE, sep=" ", dec=".")

dim(salmonRaw)    # You cannot print everything on the screen!

## ------------------------------------
## 4.1.1 Preview and structure of data:


# You already know how to extract a few rows:
salmonRaw[1:10, ]

## Some convenient functions to print a few rows/elements
head(salmonRaw)              # 6 (by default) first rows/elements.
tail(x = salmonRaw, n = 3)   # 3 last rows/elements.

head(salmonRaw$year)         # Works on vectors as well (and lists, matrices,...)

class(salmonRaw)
sapply(salmonRaw, class)    # Class of every column


summary(salmonRaw$year)     # Summarise the information in the column
summary(salmonRaw$river)    # The type of summary depends on the class/mode of the column.

summary(salmonRaw)          # summary by column.

summary(salmonRaw[ , c(1, 3, 6:8, 10)]) 

## -----------------------
## 4.1.2 Basic statistics:

## Central tendency:
mean(salmonRaw$length)                  # NA sensitive =>
mean(salmonRaw$length, na.rm = TRUE)    # must be explicitly told not to take NAs into account

median(salmonRaw$length, na.rm = TRUE)

## Variability:
sd(salmonRaw$length, na.rm = TRUE)    # Standard error.
var(salmonRaw$length, na.rm = TRUE)   # Variance.


## behaviour of logical:
sum(c(TRUE, FALSE, TRUE))  # behave as 0/1 => sum counts the number of TRUE

sum(salmonRaw$sea_age >= 4, na.rm=TRUE)  # Number of individuals spending 4y or more at sea
mean(salmonRaw$sea_age >= 4, na.rm=TRUE) # Proportion _____________________________________

sum(is.na(salmonRaw$year))  # Number of samples for which the year wasn't reported.

## Quantiles:
quantile(x = salmonRaw$length, na.rm=TRUE) # Default: quartiles

quantile(x = salmonRaw$length, na.rm=TRUE,
         probs = c(0.025, 0.975))           # You can change the calculated quantiles.


## Repartition of values / contingency tables:
table(salmonRaw$sea_lice)
table(salmonRaw$sea_lice, useNA = "ifany")

table(salmonRaw$wild, salmonRaw$sea_lice, useNA = "ifany")

table(wild = salmonRaw$wild,            # Note that you can name the variable
      "sea Lice" = salmonRaw$sea_lice,  # to avoid confusion (with or without "").
      useNA = "ifany")

## Useful tip to avoid repeating the call to the data.frame name:
with(salmonRaw,                  # Working in a seperate environment...
     table(wild = wild,          # where columns are seen as separate objects.
           "sea lice" = sea_lice,
           useNA = "ifany"))



