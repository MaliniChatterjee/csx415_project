#' Random Forest Model generation
#' This will generate the random forest model using caret library.
#' @param  dat_file
#' @keywords
#' @export
#' @examples
#'
#'fit_rf_model1()
fit_rf_model1 <- function(dat_file=TRUE){
library("caret")
fit_rf_mod<-train(y ~ age + job + marital+education+default+balance+housing+loan+contact+duration+campaign+pdays+previous+poutcome,data=dat_file,method="rf",
                trControl=trainControl(method="cv",number=5),
                prox=TRUE,allowParallel=TRUE)
print('Random Forest Model Trained')
return(fit_rf_mod)
#print(rf_model)
}
