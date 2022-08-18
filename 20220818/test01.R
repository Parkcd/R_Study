library(dplyr)
exam <- read.csv("data/csv_exam.csv")
exam
dim(exam)

#exam에서 class가 1인 경우만 추출해 출력
exam %>%  filter(class == 1)

#exam에서 class가 1인 경우만 추출해 출력
exam %>%  filter(class == 2)

#exam에서 class가 1인 경우만 추출해 출력
exam %>%  filter(class != 1)

#math가 50점을 초과한 경우
exam %>% filter(math > 50)
exam

#영어 점수가 80점 이하출력
exam %>%  filter (english <= 80)

# 여러조건 & 를 사용해서 나열
# 1반이면서 수학 점수가 50점 이상인 경우
exam %>%  filter (class == 1 & math >= 50)

# 영어점수가 90점 미만이거나 과학 점수가 50점 미만인 경우
exam %>%  filter (english < 90 | science < 50)

#math만 추출
exam %>% select (math)

#class,math,english
exam %>% select (class,math,english)

# science만 제외
exam %>% select (-science)

# class가 1인 행만 추출한 다음 english 추출
exam %>% filter (class == 1) %>% 
         select (english)

# id, math 추출하되 , 앞부분 6행까지만 추출
exam %>% select (id , math) %>% 
         head

# math 오름차순 정렬
exam %>% 
  arrange(math)

# math 내림차순 정렬
exam %>% 
  arrange(desc(math))

# class 및 math 오름차순
exam %>%   
  arrange(class,math)

# 총합 변수 추가
exam %>% 
  mutate(total = math + english + science) %>% 
  head

# 총합 / 평균 변수 추가
exam %>% 
  mutate(total = math + english + science , 
         mean = (math + english + science)/3) %>%
  head

# 과학점수가 60점이상이면 pass, 그렇지 않으면 fail
exam %>% 
  mutate (result = ifelse(science >=60 , "pass" , "fail")) %>% 
  head

# 종합점수를 계산하고 총합점수 순으로 정렬
exam %>% 
  mutate (total = math+english+science) %>%
  arrange(desc(total)) %>% 
  head  

# 집단별 요약
# math 평균 산출
exam %>%  summarise(mean_math = mean(math))

# class별로 분리 // math 평균 산출
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

# class별로 분리
# math 평균
# math 합계
# math 중앙값
# 학생 수
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n= n())

# dplyr 패키지 응용
#mpg 에 대해 
#1. 회사별로 분류
#2. SUV 추출
#3. 통합 연비 변수 생성
#4. 통합 연비 평균 산출
#5. 내림차순 정렬
#6. 1~5위 까지 출력

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

# 데이터 합치기 (가로/세로 합치기)

#중간고사
test1 <-  data.frame(id=c(1,2,3,4,5),
                     midterm=c(60,80,70,90,85))
test1
#기말고사
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80))
test2
#합치기
total <- 
