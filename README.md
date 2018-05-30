
# Bank_Marketing

Welcome to Bank_Marketing project!

A BMS Subscription Model generation.It calls different functions for model generation.
Performance evaluation of the model and testing on sample test data.Plot ROC curves 
for all the different models to compare the performance and test some results,
Models in consideration: Logistic Regression, Decision Tree, Random Forest.
The outcome of the model is to predict the probability that a customer will subscribe
to this new product.Sample Result set shows whom to call who has a higher probability
to subscribe to the new product.

Folders and their description:
data: Contains the source bank.csv , bank_test_model.csv , 
data: Model as data rf_model.Rds, tree_model.Rds, glm_model.Rds
data: rf_preds_sales.csv Sales Leads from rf model predictions for sample test data bank_test_model.csv
docs: All rmarkdown documents for formal problem statement, initial analysis, 
reports: Model Performance 
graphs: Exploratory Data Analysis Plots
graphs: Decision Tree Plot
grpahs: Plot_ROC
bms2: Packages folder used for all the code created for the model: train/fit/performance/test the model and run the results
bms2/packrat/bundles: bms2-2018-05-29.tar.gz
deploy instructions placed in DEPLOY.md and docs/Install_BMS_Guide.Rmd
