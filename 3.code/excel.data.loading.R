###-------------------------------------------------------
### openxlsx package
###-------------------------------------------------------

# package loading
require(openxlsx)

data.salmon <- read.xlsx('N:/0_r_training/1_course_v2/2_data/salmonRaw.xlsx', sheet = 1, colNames = T)

write.xlsx(data.salmon, file = 'salmonRaw.xlsx')