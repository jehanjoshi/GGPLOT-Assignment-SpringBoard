library(dplyr)
library(tidyr)
library(readxl)

#0)Load the required file
titanic_raw <- read_excel('titanic3 (1).xls')

#1) replace missing values in embarked with "S"
titanic_test <- titanic_test %>%
mutate(embarked = replace(embarked,is.na(embarked), "S")) %>%
mutate(embarked = replace(embarked, embarked == "", "S")) %>%
mutate(embarked = replace(embarked, embarked == " ", "S"))

#2) Replace the missing values in the age with their mean 
titanic_test <- titanic_test %>%
mutate(age = replace(age, is.na(age), mean(age, na.rm = TRUE)))

#3) Replace the missing values in the boat with "None" 
titanic_test <- titanic_test %>%
 mutate(boat = replace(boat, is.na(boat), "None"))

#4) Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise.
titanic_test <- titanic_test %>%
mutate(has_cabin_number = as.integer(!is.na(cabin)))

#5) Save cleaned file
write.csv(titanic_test, "CleanedT.csv")

