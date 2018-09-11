###############
## 3 
###############

## =======================
## Exercises 3.2-1

## 1) With the table people :

## 1.1) Extract the third column
people[ , 3]

## 1.2) Extract the fourth row
people[4 , ]

## 1.3) How to extract the age of the second row?
people[2 , 5]
people[2 , "age"]
people[2 , 'age']

## =======================
## Exercises 3.2-2

## 1) What is the class of the column "section"?

people
class(people)

people[ , "section"]

people$section

class(people$section)

## 2) List the different "sections" in the dataset (clue in 2.1.4, 2.2.3).
levels(people$section)
