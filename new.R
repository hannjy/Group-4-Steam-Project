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
