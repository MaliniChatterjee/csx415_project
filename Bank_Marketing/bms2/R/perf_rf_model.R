#' Performance of RF models on test data
#' This is used to also generate the AUC values, get FPR, TPR and get the data
#' for plotting the ROC curve for the model.
#' @param  rf_model,test_set
#' @keywords
#' @export
#' @examples
#'
#'perf_rf_model()
perf_rf_model <- function(rf_model,test_set){

rf_preds <- predict(rf_model, newdata = test_set, type = 'prob')[,2]
# create the prediction objects for model
pred_rf <- prediction(predictions = rf_preds, labels = test_set$y_num)
auc_rf <- performance(pred_rf, measure = 'auc')
cat('AUC_RF: ',auc_rf@y.values[[1]],'\n')
# get the FPR and TPR for the random forest model
# recall that the ROC curve plots the FPR on the x-axis
perf_rf <- performance(pred_rf, measure = 'tpr', x.measure = 'fpr')
perf_rf_tbl <- tibble(perf_rf@x.values[[1]], perf_rf@y.values[[1]])
# Change the names of the columns of the tibble
names(perf_rf_tbl) <- c('fpr', 'tpr')
return(perf_rf_tbl)
}
