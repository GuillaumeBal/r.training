## -----------------------
## Exercises 2.5
a <- c(10, 5, 4.1, 100)
a

class(a)
mode(a)



## -----------------------
## Exercises 2.7

## 1)
?runif
x <- runif(n = 10, min = 0, max=10)
x

## 2)
x > 5
which(x > 5)

## 3)
sqrt(x)^2 == x
all(sqrt(x)^2 == x)  # Not all strictly ==

## 4)
abs(sqrt(x)^2 - x) <= sqrt(.Machine$double.eps)

all(abs(sqrt(x)^2 - x) <= sqrt(.Machine$double.eps))

## -----------------------
## Exercises 2.9

## 1)
2:(length(x) + 1)
(1:length(x)) + 1

## 2)
seq_along(x) + 1

## 3)
x2 <- rev(x)
x2

## ----------------------
## Exercises 3.2

## ----------------------
## Exercises 3.5

class(salmonRaw$river)

levels(salmonRaw$river)

salmonSub <- subset(salmonRaw,
                    is.element(river,
                               c("corrib", "scorff")))

nrow(salmonSub)

salmonSub <- subset(salmonRaw,
                    river %in% c("corrib", "scorff"))

nrow(salmonSub)

salmonSub <- subset(salmonRaw,
                    river == "corrib" | river == "scorff")  # That's the ugly one ;)

nrow(salmonSub)

## ----------------------
## Exercises 3.2

## 1)
salmonTidy <- salmonRaw

## 2)

sum(salmonTidy$weight > 50, na.rm=TRUE)

summary(salmonTidy$weight[salmonTidy$weight > 50])  # 50 seems a good threshold to seperate
                                                    # individuals entered in kg and g.

salmonTidy$weight[salmonTidy$weight > 50] <- 
  salmonTidy$weight[salmonTidy$weight > 50] / 1000  # Error because of NAs =>

salmonTidy$weight[which(salmonTidy$weight > 50)] <- 
  salmonTidy$weight[which(salmonTidy$weight > 50)] / 1000

# salmonTidy$weight[salmonTidy$weight > 50 &
#                   ! is.na(salmonTidy$weight)] <- # Alternative by explicitly taking not NA values.
#   salmonTidy$weight[salmonTidy$weight > 50 &
#                     ! is.na(salmonTidy$weight)] / 1000

summary(salmonTidy$weight)  # Seems better

## 3)
summary(salmonTidy$julian_day)
summary(salmonTidy$year)

salmonTidy <- subset(salmonTidy,
                     ! is.na(year) & ! is.na(julian_day) &  # Keep what is not NA
                       julian_day <= 365)                   # AND below 365j.

summary(salmonTidy[ , c("year", "julian_day")])  # Sounds good.

## 4)
head(salmonTidy$wild)

salmonTidy$wild <- salmonTidy$wild == 1

head(salmonTidy$wild)

## 5)
write.table(salmonTidy,
            file = "./salmonTidy.csv", 
            sep = ",", dec = ".", row.names = FALSE)

