#' Performance of Decision Tree Model on test data
#' This is used to also generate the AUC values, get FPR, TPR and get the data
#' for plotting the ROC curve for the model.Also, to get the cut-offs.
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
  cat('\n','AUC_TREE: ',auc_tree@y.values[[1]],'\n')
  # get the FPR and TPR for the decision tree model
  perf_tree <- performance(pred_tree, measure = 'tpr', x.measure = 'fpr')
  perf_tree_tbl <- tibble(perf_tree@x.values[[1]], perf_tree@y.values[[1]])
  # Create cutoffs matrix for Decision Tree model
  tree_cutoffs <- data.frame(cut=perf_tree@alpha.values[[1]], fpr=perf_tree@x.values[[1]], tpr=perf_tree@y.values[[1]])
  tree_cutoffs <- tree_cutoffs[order(tree_cutoffs$tpr, decreasing = FALSE),]
  print("CUTOFF TREE")
  print(head(subset(tree_cutoffs, tpr>=0.6)))
  # Change the names of the columns of the tibble
  names(perf_tree_tbl) <- c('fpr', 'tpr')
  return(perf_tree_tbl)
}
