library(dplyr)
names(iris)
iris_means <- iris |> 
    mutate(across(Sepal.Length:Petal.Width, ~ mean(.x, na.rm = TRUE)))
mean(iris$Sepal.Length)



iris_numbers <- iris |> 
    select(1:4)

iris_means <- iris_numbers |> 
    summarise(across(Sepal.Length:Petal.Width, ~ mean))

iris_means <- as.data.frame(lapply(iris_numbers, quantil (c(0.05, 0.95))))

quants <- c(0.05, 0.95)
iris_quantiles <- apply(iris_numbers[1:4] , 2 , quantile , probs = quants , na.rm = TRUE )

quants <- c(0.05,0.95)

y_point_pred_df <- as.data.frame(y_point_pred_grid)
linear_uncertainty <-  as.data.frame(apply( y_linpred_cis[1:15] , 2 , quantile , probs = quants , na.rm = TRUE ))
linear_uncertainty_t <- as.data.frame(t(linear_uncertainty))
y_pred_cis <- as.data.frame(y_pred_grid)
prediction_uncertaintly <- as.data.frame(apply(y_pred_cis[1:15] , 2 , quantile , probs = quants , na.rm = TRUE ))
prediction_uncertainty_t <- as.data.frame(t(prediction_uncertaintly))

library(dplyr)
library(gt)

gt_tbl <- gt(m1_estimates)
gt_tbl |>
    tab_header(
        title = "Model 1 estimates of point, point uncertainty and prediction uncertianty for lion age from nose markings",
        subtitle = "Estiates at 5% intervals for nose markings over the range of the sample data"
    )
gt_tbl

#adding a testing note
