## Exo2.2

## 1)
seq5 <- 1:5
seq5

## 2)
names(seq5) <- c("a", "b", "c", "d", "e") # letters[1:5]
names(seq5)

## 3)
seq5[c(2, 4)]
seq5[c("b", "d")]
seq5[c(FALSE, TRUE, FALSE, TRUE, FALSE)]


## 4)
salmonRaw <- read.table(file="P:/0_r_training/salmonRaw.txt",
                        header=TRUE, sep=" ", dec=".")

head(salmonRaw)

class(salmonRaw)

salmonSub10 <- salmonRaw[1:10 , ]

salmonSub10$wild <- NULL

salmonSub10$length >= 80
salmonSub10[salmonSub10$length >= 80 , ]
