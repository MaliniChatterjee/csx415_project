#' Decision Tree Model build and plot the decision tree-saved in graphs.
#' @param dat_file
#' @keywords
#' @export
#' @examples
#'
#' fit_tree_model()
fit_tree_model <- function(dat_file=TRUE){
  library("modelr")
  library("rpart")
  library("caret")
  library("partykit")
  library("libcoin")
  #tree_mod <- train(y ~ age + job + marital+education+default+balance+housing+loan+contact+duration+campaign+pdays+previous+poutcome,
  #                  data=dat_file,method = "rpart",cp=0.002,maxdepth=8)
  tree_mod <- rpart(y ~ age + job + marital+education+default+balance+housing+loan+contact+duration+campaign+pdays+previous+poutcome,data=dat_file)
  print('Decision Tree Model Trained')
  # plot the tree
  #png(filename="C:\\Users\\chatt\\OneDrive\\Documents\\Bank_Marketing\\graphs\\decsn_tree1.png")
  #plot(fit)
  #plot(as.party(tree_mod))
  #dev.off()
  return(tree_mod)
}
