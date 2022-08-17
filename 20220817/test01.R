#install.packages("readxl")
library(readxl)

df_exam <- read_excel("./data/excel_nt_exam.xlsx" , col_names = F , sheet=2)
df_exam

df_csvfile <- read.csv("./data/excel_exam.csv" , stringsAsFactors=F)
df_csvfile

#데이터 프레임 만들기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

#CSV 파일로 저장하기
write.csv(df_midterm, file="df_midterm.csv")
