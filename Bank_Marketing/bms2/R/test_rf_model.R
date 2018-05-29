#' Test of RF models on sample data set
#' @param  rf_model,data_test
#' @keywords
#' @export
#' @examples
#'
#'test_rf_model()
test_rf_model <- function(rf_model,data_test){

  rf_preds <- predict(rf_model, newdata = data_test, type = 'prob')[,2]
  # create the prediction objects for model
  #pred_rf <- prediction(predictions = rf_preds, labels = test_set$y_num)
  cat('\n','DECIDE To CALL or not to call SAMPLE SET TESTING','\n')
  result <- cbind(data_test[,0:16],rf_preds)
  write.csv(result, file = 'data/rf_preds_sales.csv')
  print(result)
  #yes_set <-result[result$rf_preds >= 0.5]
  #print(yes_set)
  # Write sales lead
  return(result)
}
