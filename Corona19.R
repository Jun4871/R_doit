# # 패키지 설치
# install.packages("googledrive")
# library(googledrive)
# drive_auth()
# corona19-kr
# 
# drive_download(file = corona19-kr, overwrite = TRUE)


corona19 <- read.csv("corona19_kr.csv", fileEncoding = "CP949", encoding = "UTF-8", header = TRUE)
str(corona19)

# install.packages("Kormaps") 설치안됨.
install.packages("tmap")
require(Kormaps)
require(tmap)
