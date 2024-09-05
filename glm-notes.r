m4 <- glm(age ~ percentage.black, data = lion_noses, family = gaussian)

broom::tidy(m4, prob = 0.9, effects = c("fixed", "aux"))

broom::glance(m4)

round(confint(m4, level = 0.9), 3)

### from ISLR 3.6.2

m5 <- lm(age ~ percentage.black, data = lion_noses) # using lm rather than glm, check any difference

m5 # bare bones output of parameters 

summary(m5) # more info than the m5 print

names(m5) # bring up objects in m5

round(confint(m5, level = 0.9), 3)

round(predict (m5, data.frame(percentage.black = (seq(10,80,10))), interval = "confidence", level = 0.9), 3)

# repeat predict as for main rstanarm and same for brms


