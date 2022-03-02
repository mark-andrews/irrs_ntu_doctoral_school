# load up some packages
library(tidyverse)


composites <- c(4, 6, 8, 9, 10, 12)

# make vectors ------------------------------------------------------------

composites_plus_1 <- composites + 1

composites_plus_2 <- composites + 2


# make data frame ---------------------------------------------------------

# the next data frame represents .....
# blah blah
data_df <- data.frame(name = c("bob", "joe", "pat"), 
                      age = c(21, 17, 23),
                      job = c("doctor", "spy", "shopkeeper")
)

# Load data -----------------------------------------------------------

test_data <- read_csv("https://raw.githubusercontent.com/mark-andrews/irrs_ntu_doctoral_school/main/content/data/data01.csv")

test_data
glimpse(test_data)

summary(test_data)

# summary statistics using summarize
summarise(test_data, 
          avg_iq = mean(iq),
          std_iq = sd(iq),
          median_score = median(test_score),
          mad_score = mad(test_score)
)
          
group_by(test_data, sex)


summarise(group_by(test_data, sex), 
          avg_iq = mean(iq),
          std_iq = sd(iq),
          median_score = median(test_score),
          mad_score = mad(test_score),
          n = n(),
          se = std_iq / sqrt(n)
)

# filter rows where IQ >= 100 and sex == female
filter(test_data, iq >= 100, sex == 'female')

# basic 2d scatterplot
ggplot(test_data,
       aes(x = iq, y = test_score)
) + geom_point()


# 2d scatterplot , colour coded by sex
ggplot(test_data,
       aes(x = iq, y = test_score, colour = sex)
) + geom_point() 

# 2d scatterplot , colour coded by sex
ggplot(test_data,
       aes(x = iq, y = test_score, colour = sex)
) + geom_point() + stat_smooth()

# linear regression, predicting test score from IQ
result <- lm(test_score ~ iq, data = test_data)

summary(result)
plot(result) # regression diagnostics
