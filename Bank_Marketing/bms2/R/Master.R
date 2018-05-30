#' A BMS Subscription Model generation
#' It calls different functions for model generation
#' Performance testing on test-set
#' Plot ROC curves for all the different models to compare the performance
#' Models in consideration: Logistic Regression, Decision Tree, Random Forest
#' path_root should be used as setwd.
#'
#' @param  path_root
#' @keywords
#' @export
#' @examples
#'
#'
#' Master()
Master <- function(path_root){

#Load Packages
load_packages <- load_packages()
#Set working directory for Bank_Marketing project
#setwd("C:\\Users\\chatt\\OneDrive\\Documents\\Bank_Marketing")
setwd(path_root)

#Creating the train and test
train_set <- train_test("data/bank.csv")$train
test_set <- train_test("data/bank.csv")$test
#print(train_set)
#print(test_set)

#Model Build Random Forest
rf_model <- fit_rf_model1(train_set)
#Save the model
saveRDS(rf_model,"data/rf_model.Rds")
#print(rf_model)
rf_mod1=readRDS("data/rf_model.Rds")
print(rf_mod1)

#Model Build GLM
glm_model <- fit_glm_model(train_set)
#Save the model
saveRDS(glm_model,"data/glm_model.Rds")
print(summary(glm_model)) # display results

#Model Build Decision Tree
tree_model <- fit_tree_model(train_set)
#Save the model
saveRDS(tree_model,"data/tree_model.Rds")
print(tree_model)
#Plot the model
plot_tree <- plot(as.party(tree_model))
#Save the Decision Tree Model
savePlot("graphs/Decision_Tree.pdf",plot_tree)

# Create a nice ROC curve for comparing all the models
t1 <- perf_rf_model(rf_model,test_set) %>% mutate(Model = 'Random Forest')
t2 <- perf_tree_model(tree_model,test_set) %>% mutate(Model = 'Decision Tree')
t3 <- perf_glm_model(glm_model,test_set) %>% mutate(Model = 'Logistic Regression')
t4 <- bind_rows(t1, t2, t3)
plot_roc(t4,"graphs/Plot_ROC.pdf")

# Testing the model for Sample data, and provide CALL/NO CALL insights to telemarketers
test_sample <- read.csv2(file="data/bank_test_model.csv", header=T, sep=";", quote="\"",nrows=30)
head(test_sample)
testing <- as.tibble(test_sample)
print(testing)
testy <- test_rf_model(rf_mod1,testing)
print(testy)

}
