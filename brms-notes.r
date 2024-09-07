library (brms)
library(abd)
library(broom.mixed)

lion_noses <- as.data.frame(LionNoses)

lion_noses <- lion_noses %>%
  mutate(percentage.black = 100*proportion.black)

m3 <- brm(
  age ~ percentage.black,
  data = lion_noses,
  family = gaussian
)

stancode(age ~ percentage.black, data = lion_noses)

plot(m3)

print(m3, prob = .9)

broom.mixed::tidy(m3, conf.level = 0.9)

results <- as.data.frame(round(posterior_summary(m3, probs = c(0.05, 0.95))[1:3,],3))
