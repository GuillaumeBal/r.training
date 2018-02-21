## 3.3 - indexation:

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

## 1.1
people[ , 3]
dim(people[ , 3])
length(people[ , 3])

## 1.2
people[4 , ]
dim(people[4 , ])

## 1.3:
people[2 , 5]
people[2 , "age"]


## 3.3.2

## 1)
sections <- people$section
class(sections)

## 2)
levels(sections)

## 3 
#3.1

test1 <- sections == "osis" | sections == "mefss"
test2 <- sections %in% c("osis", "mefss")
test3 <- is.element(sections, c("osis", "mefss"))
test4 <- (sections == "osis" | sections == "mefss") & ! is.na(sections) 



people[test1 , ]
people[test2 , ]
people[test3 , ]
people[test4 , ]

peopleSub <- people[test2 , ]

## 4)
nrows(peopleSub)


## 5)
testFeas <- sections %in% c("feas")
test25 <- people$age < 25

testFeas25 <- testFeas & test25

people[testFeas25 , ]

people[sections %in% c("feas") &
         people$age < 25, ]

people[sections == c("feas") &
         people$age > 25, ]

people[(sections == c("feas") | is.na(sections))& 
         people$age > 25, ]

