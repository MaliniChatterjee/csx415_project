#' GLM Model build
#' @param dat_file
#' @keywords
#' @export
#' @examples
#'
#' fit_glm_model()
fit_glm_model <- function(dat_file=TRUE){
library("modelr")
library("rpart")
fit_glm_mod <- glm(y~age + job + marital+education+default+balance+housing+loan+contact+duration+campaign+pdays+previous+poutcome,
                   data=dat_file,family=binomial())
#summary(glm_mod) # display results
#confint(glm_mod) # 95% CI for the coefficients
#exp(coef(glm_mod)) # exponentiated coefficients
#exp(confint(glm_mod)) # 95% CI for exponentiated coefficients
#predict(glm_mod, type="response") # predicted values
#residuals(glm_mod, type="deviance") # residuals
print('Logistic Regression Model Trained')
return(fit_glm_mod)
}
