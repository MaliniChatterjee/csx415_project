#' Performance of Decision Tree Model on test data
#'
#' @param  tree_model,test_set
#' @keywords
#' @export
#' @examples
#'
#'perf_tree_model()
perf_tree_model <- function(tree_model,test_set){

  tree_preds <- predict(tree_model, newdata = test_set)[,2]
  # create the prediction objects for model
  pred_tree <- prediction(predictions = tree_preds, labels = test_set$y)
  auc_tree <- performance(pred_tree, measure = 'auc')
  cat('AUC_TREE: ',auc_tree@y.values[[1]],'\n')
  # get the FPR and TPR for the decision tree model
  perf_tree <- performance(pred_tree, measure = 'tpr', x.measure = 'fpr')
  perf_tree_tbl <- tibble(perf_tree@x.values[[1]], perf_tree@y.values[[1]])
  # Change the names of the columns of the tibble
  names(perf_tree_tbl) <- c('fpr', 'tpr')
  return(perf_tree_tbl)
}
