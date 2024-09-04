library(abd)
library(rstanarm)
library(ggplot2)
library(bayesplot)
library(broom.mixed)
library(dplyr)
theme_set(bayesplot::theme_default())

lion_noses <- as.data.frame(LionNoses)

lion_noses <- lion_noses %>% 
    mutate(percentage.black = 100*proportion.black)

m2 <- stan_glm(age ~ percentage.black, data = lion_noses)

broom.mixed::tidy(m2, effects = c("fixed", "aux"), 
                  conf.int = TRUE, conf.level = 0.90)

ci90 <- posterior_interval(m2, prob = 90, pars = c("percentage.black", "(Intercept)"))