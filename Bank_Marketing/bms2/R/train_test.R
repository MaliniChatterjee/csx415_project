#' Data Preparation Step
#' Reads the source data file,
#' does the initial exploratory data analysis by creating
#' and saving plots on individual features
#'
#' Also creates the sample train and test data set after taking care of any factorizatons if any
#'
#' @param  dat_file
#' @keywords
#' @export
#' @examples
#'
#'
#' train_test(dat_file)

train_test <- function(dat_file){

#train = read.csv2(file="data/bank.csv", header=T, sep=";", quote="\"")
train = read.csv2(file=dat_file, header=T, sep=";", quote="\"")
train <- train %>% mutate(y_num = case_when(y == 'no'~ 0,
                                            y == 'yes'~1))

plot_eda(train)
set.seed(987)

train_data <- resample_partition(train, c(test = 0.3, train = 0.7))
train_set1 <- as.tibble(train_data$train)
train_set1
test_set1 <- as.tibble(train_data$test)
train_test <- list("train" = train_set1, "test" = test_set1)
print("Train Test Data created")
return(train_test)
}
