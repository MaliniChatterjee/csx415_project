#' A BMS Subscription Model generation
#'
#' @param  dat_file
#' @keywords
#' @export
#' @examples
#'
#'
#' Master()
Master <- function(dat_file=TRUE){
load_packages <- load_packages()
setwd("C:\\Users\\chatt\\OneDrive\\Documents\\Bank_Marketing")

train_set <- train_test("data/bank.csv")$train
test_set <- train_test("data/bank.csv")$test
#print(train_set)
#print(test_set)
rf_model <- fit_rf_model1(train_set)
print(rf_model)
glm_model <- fit_glm_model(train_set)
print(summary(glm_model)) # display results
tree_model <- fit_tree_model(train_set)
print(tree_model)
plot(as.party(tree_model))
# Plotting function for plotting a nice ROC curve using ggplot
# Create ROC
t1 <- perf_rf_model(rf_model,test_set) %>% mutate(Model = 'Random Forest')
t2 <- perf_tree_model(tree_model,test_set) %>% mutate(Model = 'Decision Tree')
t3 <- perf_glm_model(glm_model,test_set) %>% mutate(Model = 'Logistic Regression')
t4 <- bind_rows(t1, t2, t3)
plot_roc(t4)

}
