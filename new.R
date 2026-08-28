#New file

x <- {1:10}
x

getwd()

small_march_c <- march_c[c("name", "price","dlc_count","about_the_game","short_description","windows","mac","linux","achievements",
                           "supported_languages","developers","publishers","categories","genres","estimated_owners",
                           "average_playtime_forever","peak_ccu","num_reviews_total","pct_pos_total")]

summary(small_march_c)

hist(small_march_c$price)

library(dplyr)
library(ggplot2)

# Ascending order (lowest to highest)
df_sorted <- small_march_c %>% arrange(desc(price))
df_sorted$price

filtered_df <- small_march_c %>% filter(price > 199.99)
filtered_df[,c("name","price")]

hist(filtered_df$price)

df_down <- small_march_c %>% arrange(desc(peak_ccu))
head(df_down[,c("name","peak_ccu")])

p <- ggplot(filtered_df, aes(x=price)) + 
  geom_histogram( binwidth=5, alpha=0.9) +
  scale_x_continuous(breaks = seq(199.99, 999.98, 100))+
  geom_histogram()
p

sapply(small_march_c, function(x) sum(is.na(x)))

colSums(is.na(small_march_c))

numeric_steam <- small_march_c[, sapply(small_march_c, is.numeric)]
summary(numeric_steam)

#install.packages("corrplot")
library(corrplot)

m <- cor(numeric_steam)

corrplot(m, method = "number")

#WARNING: this plot takes like 5 minutes to generate...

#pairs(numeric_steam[, 1:7], panel = function(x,y){
#  points(x,y)
#  abline(lm(y~x), col="red")})

nrow(numeric_steam)
