#' Random Forest Model generation
#'
#' @param  dat_file
#' @keywords 
#' @export
#' @examples
#' 
#'fit_rf_model()
fit_rf_model <- function(dat_file){
library("caret") 
fit_rf_mod<-train(y~.,data=dat_file,method="rf",
                trControl=trainControl(method="cv",number=5),
                prox=TRUE,allowParallel=TRUE)
return(fit_rf_mod)
#print(rf_model)
}