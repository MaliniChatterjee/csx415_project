# ASSETS of Bank Marketing Project

This markdown document contains the list of assets and artifactories produced during the different phases of this project.

## Data (Input)

We are using the Bank dataset used from financial institution. http://archive.ics.uci.edu/ml/datasets/Bank+Marketing#
We have cleaned them up, munged it and created a CSV sheet that is stored in the data folder below.

https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/data/bank.csv
https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/data/bank_test_model.csv

## Problem Statement

https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/docs/Formal_Problem_Statement_from_template.html
https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/docs/Formal_Problem_Statement_from_template.Rmd

## Initial Analysis and Visualization

https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/docs/project-performance-malini.html
https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/docs/project-performance-malini.Rmd

All plots for initial analysis placed under https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs
Age vs Y https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/AgeVsY.pdf
Marital vs Y https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/MaritalVsY.pdf
Education vs Y https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/EducationVsY.pdf
Y vs Balance https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/YVsBalance.pdf
Jobs vs Y https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/JobsVsY.pdf
Default vs Y https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/DefaultVsY.pdf
Housing vs Y https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/HousingVsY.pdf
Loans vs Y https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/LoansY.pdf

## Model Performance Evaluation

https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/docs/model-performance-malini-rpart.html
https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/docs/model-performance-malini-rpart.Rmd

## Code and all project artifactory

https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/

## All R files/packages are placed under the bms2 folder. 
There is no separate pkgs folder. bms2 can be treated as pkgs folder.
https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/bms2

## Executable code
https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/bms2/R/Master.R

## Deploy code
Packrat bundle placed in https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/bms2/packrat/bundles/bms2-2018-05-29.tar.gz
Deploy instructions in https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/docs/Install_BMS_Guide.Rmd
Also in https://github.com/MaliniChatterjee/csx415_project/blob/master/DEPLOY.md

## Model as data

The Random Forest model is saved in the underlying data folder.
https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/data/rf_model.Rds
https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/data/glm_model.Rds
https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/data/tree_model.Rds

## Plot ROC Results
https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/Plot_ROC.pdf

## Plot Decision Tree
https://github.com/MaliniChatterjee/csx415_project/blob/master/Bank_Marketing/graphs/Decision_Tree.pdf

## RF Prediction Results for sample 30 customers from bank_test_model.csv
https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/data/rf_preds_sales.csv
This is the result of model predictions for the telemarketer to call a customer to sell the product subscription.Line 14 predicts a probability 0.782, since its greater than 0.50, it can be considered as Yes by the model prediction. Now, based on the telemarketer's analysis on the customer features and the model prediction, he/she can take an informed decision to either call or not call the customer.

