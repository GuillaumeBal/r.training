# salmonRaw <- read.table(file="P:/0_r_training/salmonRaw.txt",
#                         header=TRUE, sep=" ", dec=".")

## 1)

class(salmonRaw$river)


## 2)
levels(salmonRaw$river)

unique(salmonRaw$river)

## 3)
## Subset:
salmonRaw$river == "corrib" | salmonRaw$river == "scorff"
salmonRaw$river %in% c("corrib", "scorff")

is.element(salmonRaw$river, c("corrib", "scorff"))

salmonSub <- salmonRaw[is.element(salmonRaw$river, 
                                  c("corrib", "scorff")) , ]

unique(salmonSub$river)

## Order:
salmonSub <- salmonSub[order(salmonSub$river, salmonSub$year) , ]

head(salmonSub)


## 4)
nrow(salmonSub)
dim(salmonSub)

## 5)
write.table(x = salmonSub,
            file = "salmonSub.csv",
            sep = ",", dec = ".", row.names = FALSE)
