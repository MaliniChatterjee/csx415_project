#' Performance of GLM models on test data
#'
#' @param  glm_model,test_set
#' @keywords
#' @export
#' @examples
#'
#'perf_glm_model()
perf_glm_model <- function(glm_model,test_set){

  glm_preds <- predict(glm_model, newdata = test_set, type='response')
  # create the prediction objects for model
  pred_glm <- prediction(predictions = glm_preds, labels = test_set$y_num)
  auc_glm <- performance(pred_glm, measure ='auc')
  cat('AUC_GLM: ',auc_glm@y.values[[1]],'\n')
  # get the FPR and TPR for the logistic regression model
  perf_glm <- performance(pred_glm, measure= 'tpr', x.measure = 'fpr')
  perf_glm_tbl <- tibble(perf_glm@x.values[[1]], perf_glm@y.values[[1]])
  # Change the names of the columns of the tibble
  names(perf_glm_tbl) <- c('fpr', 'tpr')
  return(perf_glm_tbl)
}
