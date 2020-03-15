housing <- read.csv("housing.csv", sep = ",",
                    header = TRUE, stringsAsFactors = FALSE)
housing_T <- housing 
str(housing)
summary(housing)
sum(is.na(housing))

# 각 변수에 좋은 이름 붙이기
names(housing_T) <- c("Neighborhood", "Class", "Units", "YearBuilt",
                    "SqFt", "Income", "IncomePerSqFt", "Expense",
                    "ExpensePerSqFt", "NetIncome", "Value",
                    "ValuePerSqFt", "Boro")

# 변수 명 변경됐는지 확인
summary(housing_T)

# 모형 적합 [반응변수(측정값, ~ 예측변수(예측시 사용할 값)]
house1 <- lm(data = housing_T, ValuePerSqFt ~ Units + SqFt + Boro)
summary(house1) # 잔차요약 통곗값, 상관계수, 모델 품질/요약 통계

# 모형 시각화
# install.packages("coefplot")
library(coefplot) # 모형 시각화를 위한 패키지 활성화
coefplot(house1)

# 잔차에 기초한 진달 그래프 생성
library(ggplot2)

# 새롭게 내용이 첨가된 lm 확인 / 그래프를 객체로 저장
# x,y축에 대해 새로 만들어진 열들을 사용하는 것을 주목할 것. 열들의 이름은 .fitted, .resid
head(fortify(house1))

h1 <- ggplot(data = house1, aes(x = .fitted, y= .resid)) +
               geom_point() +
               geom_hline(yintercept = 0) +
               geom_smooth(se = F) +
               labs(x = "Fitted Values", y ="Residuals")

# 플롯 프린팅
h1               

h1 + geom_point(aes(color = Boro))
