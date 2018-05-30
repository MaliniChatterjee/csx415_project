#' A Load Package libraries
#'
#' @param  default
#' @keywords
#' @export
#' @examples
#'
#'
#' load_packages()

load_packages <- function(){
  library(tidyverse)
  library(broom)
  library(rpart)
  library(ROCR)
  library(partykit)
  library(modelr)
  library(randomForest)
  library(devtools)
  library(roxygen2)
  library(caret)
  library(ggplot2)
  library(reshape)
  library(plyr)
  library(dplyr)
  library(stringr)
  library(lubridate)
  library(libcoin)
  library(testthat)
  print("All libraries loaded")
}
