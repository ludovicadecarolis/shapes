## code to prepare `my_dataset` dataset goes here
library(tibble)
my_dataset<-as_tibble(rownames_to_column(mtcars,var='car'))

usethis::use_data(my_dataset, overwrite = TRUE)
