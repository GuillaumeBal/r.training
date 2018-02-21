## 3.2.1 - indexation:

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

## 1.1) Extract the third column:
people[ , 3]
dim(people[ , 3])
length(people[ , 3])

## 1.2) Extract the fourth row:
people[4 , ]
dim(people[4 , ])

## 1.3) How to extract the age of the second row?
people[2 , 5]
people[2 , "age"]


## 3.2.3 - Indexing data.frames, continued...

## 1) What is the class of the column "section"?
sections <- people$section
class(sections)

## 2) List the different "sections" in the dataset:
levels(sections)

## 3) Create a new data.frame (named peopleSub) with only persons from "osis" and "mefss"
## 3.1:

test1 <- sections == "osis" | sections == "mefss"
test2 <- sections %in% c("osis", "mefss")
test3 <- is.element(sections, c("osis", "mefss"))
test4 <- (sections == "osis" | sections == "mefss") & ! is.na(sections)


## 3.2:
people[test1 , ]
people[test2 , ]
people[test3 , ]
people[test4 , ]

## 3.3:
peopleSub <- people[test2 , ]

## 4) How many rows does it contain?

nrows(peopleSub)


## 5) Extract the data for people from feas who are less the 25.

testFeas <- sections %in% c("feas")
test25 <- people$age < 25

testFeas25 <- testFeas & test25

people[testFeas25 , ]

## Or:
people[sections %in% c("feas") &
         people$age < 25, ]

## !!! NAs:
people[sections == c("feas") &
         people$age > 25, ]             # Issue with NA!

people[(sections == c("feas") | is.na(sections))&
         people$age > 25, ]

