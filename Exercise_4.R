# 3.	Install from github the datarium package: https://rdrr.io/github/kassambara/datarium/.
# Load the marketing data set in R by: data("marketing", package = "datarium")
#• (II) Find the best linear regression model to predict sales by using 10-fold CV
#and LOOCV. Estimate in addition to the MSE its standard error. 


## LOADING DATA AND REQUIREMENT LIBRARIES
# install.packages("devtools")
# install.packages("caret")
# install_github("kassambara/datarium")

library(devtools)
library(caret)
data("marketing", package = "datarium")
set.seed(123)

### (I)
# View(marketing) # Check all the data for know the meaning
head(marketing) # Check only head of data


### (II) 
## USING 10-FOLD CV
train_ctrl10fold <- trainControl(method = "cv", number = 10)
model10fold <- train(sales ~ ., 
                     data = marketing, 
                     method = "lm", 
                     trControl = train_ctrl10fold)
print(model10fold)

#view final model
#model10fold$finalModel
#view predictions for each fold
#model10fold$resample

## USING LOOCV
# Applying the same method with 10-FOLD CV
train_ctrlloocv <- trainControl(method = "LOOCV")

# training the model by assigning sales column
# as target variable and rest other column
# as independent variable
modelloocv <- train(sales ~., 
               data = marketing,
               method = "lm",
               trControl = train_ctrlloocv)

# printing model performance metrics
# along with other details
print(modelloocv)
coef(modelloocv$finalModel, simplify = TRUE)
coef(model10fold$finalModel)


# 4. For a cohort of people we know that 13 of them did get a ﬂu shot at the beginning
# of the winter and 28 did not. Of the 13 who had a ﬂu shot, 3 got the ﬂu during
# the winter. Of the 28 who did not get a ﬂu shot, 15 got the ﬂu.
# • (I) Formulate a null hypothesis and alternative hypothesis and decide which
# hypothesis test to use.
# • (II) Estimate the p-value using the hypothesis test.
# • (III) Estimate the p-value directly by using the sampling distribution.
# • (IV) Discuss the result.
# Provide the R script.

## Estimate the p-value using the hypothesis test.

n1 <- 13
n2 <-28
x1 <- 3
x2 <-15

# Calculate the probability of each p1 and p2
dat <- data.frame(
  "a"=c(3,10),
  "b"=c(15,13),
  row.names = c("Got the flu", "Didn't get a flu"),
  stringsAsFactors = FALSE
  )
colnames(dat) <-c("Had a flu shot", "Didn't have a flu shot")
test <- fisher.test(dat)
test



