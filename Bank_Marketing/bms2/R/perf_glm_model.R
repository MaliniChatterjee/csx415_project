#' Performance of GLM models on test data
#'
#' This is used to also generate the AUC values, get FPR, TPR and get the data
#' for plotting the ROC curve for the model.Also, to get the cut-offs.
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
  cat('\n','AUC_GLM: ',auc_glm@y.values[[1]],'\n')
  # get the FPR and TPR for the logistic regression model
  perf_glm <- performance(pred_glm, measure= 'tpr', x.measure = 'fpr')
  perf_glm_tbl <- tibble(perf_glm@x.values[[1]], perf_glm@y.values[[1]])
  # Create cutoffs matrix for GLM model
  glm_cutoffs <- data.frame(cut=perf_glm@alpha.values[[1]], fpr=perf_glm@x.values[[1]], tpr=perf_glm@y.values[[1]])
  glm_cutoffs <- glm_cutoffs[order(glm_cutoffs$tpr, decreasing = FALSE),]
  print("CUTOFF GLM")
  print(head(subset(glm_cutoffs, tpr>=0.6)))
  # Change the names of the columns of the tibble
  names(perf_glm_tbl) <- c('fpr', 'tpr')
  return(perf_glm_tbl)
}
