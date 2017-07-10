## 1)

salmonTidy <- salmonRaw

summary(salmonTidy)


 ## 2)

summary(salmonTidy$weight > 50)
summary(which(salmonTidy$weight > 50))

salmonTidy$weight[which(salmonTidy$weight > 50)]

salmonTidy$weight[which(salmonTidy$weight > 50)] <- 
  salmonTidy$weight[which(salmonTidy$weight > 50)] / 1000

summary(salmonTidy$weight)

## Alternative:
ifelse(c(TRUE, FALSE, TRUE, NA),
       c(1, 2, 3, 4),
       c(10, 20, 30, 40))

summary(ifelse(salmonTidy$weight > 50,
               salmonTidy$weight / 1000,
               salmonTidy$weight))

salmonTidy$weight <- ifelse(salmonTidy$weight > 50,
                            salmonTidy$weight / 1000,
                            salmonTidy$weight)

summary(salmonTidy$weight)

## 3)
# test <- salmonTidy[ ! is.na(salmonTidy$weight), ]
# summary(test)

! is.na(salmonTidy$year) & ! is.na(salmonTidy$julian_day) &
  salmonTidy$julian_day <= 365

# salmonTidy <- salmonTidy[! is.na(salmonTidy$year) & ! is.na(salmonTidy$julian_day)  &
#                          salmonTidy$julian_day <= 365 , ]

salmonTidy <- salmonTidy[! (is.na(salmonTidy$year) | 
                            is.na(salmonTidy$julian_day) |
                            salmonTidy$julian_day > 365), ]

summary(salmonTidy[ , 1:2])

## 4)
head(salmonTidy$wild == 1)
salmonTidy$wild <- salmonTidy$wild == 1

summary(salmonTidy)

## 5) 
write.csv(x = salmonTidy,
          file = "salmonTidy.csv")

