#' A BMS Subscription Model generation
#'
#' @param  dat_file
#' @keywords
#' @export
#' @examples
#'
#'
#' Master()
Master <- function(dat_file=TRUE){
load_packages <- load_packages()
setwd("C:\\Users\\chatt\\OneDrive\\Documents\\Bank_Marketing")

train_set <- train_test("data/bank.csv")$train
test_set <- train_test("data/bank.csv")$test
print(train_set)
print(test_set)
rf_model <- fit_rf_model1(train_set)
print(rf_model)

glm_model <- fit_glm_model(train_set)
print(summary(glm_model)) # display results
tree_model <- fit_tree_model(train_set)
print(tree_model)
plot(as.party(tree_model))
#plot(as.party(tree_model$finalModel))

#' predict the test data
rf_preds <- predict(rf_model, newdata = test_set, type = 'prob')[,2]
tree_preds <- predict(tree_model, newdata = test_set)[,2]
glm_preds <- predict(glm_model, newdata = test_set, type='response')

# create the prediction objects for both models
pred_rf <- prediction(predictions = rf_preds, labels = test_set$y_num)
pred_tree <- prediction(predictions = tree_preds, labels = test_set$y)
pred_glm <- prediction(predictions = glm_preds, labels = test_set$y_num)
# calculate the AUC
auc_rf <- performance(pred_rf, measure = 'auc')
auc_tree <- performance(pred_tree, measure = 'auc')
auc_glm <- performance(pred_glm, measure ='auc')

#'  Extract AUC Value for Random Forest,Decision Tree. Logistic Regression
# extract the AUC value for random forest
print(auc_rf@y.values[[1]])
# extract the AUC value for decision tree
print(auc_glm@y.values[[1]])
# extract the AUC value for GLM
print(auc_tree@y.values[[1]])


# get the FPR and TPR for the random forest model
# recall that the ROC curve plots the FPR on the x-axis
perf_rf <- performance(pred_rf, measure = 'tpr', x.measure = 'fpr')
perf_rf_tbl <- tibble(perf_rf@x.values[[1]], perf_rf@y.values[[1]])
# Change the names of the columns of the tibble
names(perf_rf_tbl) <- c('fpr', 'tpr')
# get the FPR and TPR for the decision tree model
perf_tree <- performance(pred_tree, measure = 'tpr', x.measure = 'fpr')
perf_tree_tbl <- tibble(perf_tree@x.values[[1]], perf_tree@y.values[[1]])
# Change the names of the columns of the tibble
names(perf_tree_tbl) <- c('fpr', 'tpr')
# get the FPR and TPR for the logistic regression model
perf_glm <- performance(pred_glm, measure= 'tpr', x.measure = 'fpr')
perf_glm_tbl <- tibble(perf_glm@x.values[[1]], perf_glm@y.values[[1]])
# Change the names of the columns of the tibble
names(perf_glm_tbl) <- c('fpr', 'tpr')
# Plotting function for plotting a nice ROC curve using ggplot
# Create ROC
t1 <- perf_rf_tbl %>% mutate(Model = 'Random Forest')
t2 <- perf_tree_tbl %>% mutate(Model = 'Decision Tree')
t3 <- perf_glm_tbl %>% mutate(Model = 'Logistic Regression')
t4 <- bind_rows(t1, t2, t3)
plot_roc(t4)

}
