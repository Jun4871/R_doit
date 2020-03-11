install.packages("dygraphs")

library(dygraphs)

economics <- ggplot2::economics

head(economics)

library(xts)

eco <- xts(economics$unemploy, order.by = economics$date)

head(eco)

dygraph(eco)
