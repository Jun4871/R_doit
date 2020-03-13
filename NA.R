df <- data.frame(sex = c("M", "F",NA,"M","F"),
                 score = c(5, 4, 3, 4, NA))

df
is.na(df)

table(is.na(df))

table(is.na(df$sex))

table(is.na(df$score))

mean(df$score)

df$score

library(dplyr)

df %>% filter(is.na(df$score))

df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)

sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2
