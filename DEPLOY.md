## Desired R version 3.4.4
## Deploy Instructions
```{r load_packages, warning=FALSE, message=FALSE, echo=FALSE}
# install the packages
install.packages('devtools')
install.packages('ProjectTemplate')
install.packages('packrat')
install.packages('tidyverse')
install.packages('broom')
install.packages('rpart')
install.packages('ROCR')
install.packages('partykit')
install.packages('modelr')
install.packages('randomForest')
install.packages('devtools')
install.packages('roxygen2')
install.packages('caret')
install.packages('e1071')
install.packages('reshape')
install.packages('testthat'
# load the packages
library('ProjectTemplate')
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
library(packrat)
library(testthat)
```

# Setting up project BMS_DevOps
```{BMS_DEVOPS, warning=FALSE, message=FALSE, echo=FALSE}

create.project("BMS_DEVOPS")

```

# Copying the data 
```{Copy Data, warning=FALSE, message=FALSE, echo=FALSE}

# Copy from github link to "data" folder under the project BMS_DEVOPS
# https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/data
bank.csv and bank_test_model.csv
# Also ensure the directory structure has docs,graphs,reports folders.
```
# Set working directory
```{setwd, warning=FALSE, message=FALSE, echo=FALSE}

#setwd("PATH_TO_BMS_DEVOPS_DIRECTORY")
#Sample Windows path 
setwd("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS")
library('ProjectTemplate')
load.project()
```
# Option 1) Using github 
```{github, warning=FALSE, message=FALSE, echo=FALSE}
library(devtools)
install_github("MaliniChatterjee/bms3",ref='master')
Once install is complete
library("bms3")
?bms3::Master
```

# Option 2) Using Packrat Unbundle
```{unbundle, warning=FALSE, message=FALSE, echo=FALSE}

#copy the packrat bundle from github to local folder 
 https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/bms2/packrat/bundles/bms2-2018-05-30.tar.gz?
##Sample Windows path where to copy 
setwd("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS")
library('packrat')
packrat::init()
#packrat::unbundle("local path for bms2-2018-05-30.tar.gz", "C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS\\")
packrat::unbundle("C:\\Users\\chatt\\OneDrive\\Documents\\Bank_Marketing\\bms2\\packrat\\bundles\\bms2-2018-05-30.tar.gz", "C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS\\")
# this would copy the bms2 package which we need to deploy and execute

```

# Option 3) Alternate option copy the package from github
```{package_creation, warning=FALSE, message=FALSE, echo=FALSE}

#copy the package contents from github <URL>
#Sample Windows path where to copy 
setwd("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS")
library('devtools')
create("bms2")
# this would create the bms2 packages folder under working directory.
# It should have the R folder and Description/Namespace/Rproj created.
# Copy the contents of the package from github 
# https://github.com/MaliniChatterjee/csx415_project/tree/master/Bank_Marketing/bms2
# Need to install this new package bms2 
# setwd("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS\\bms2")
# document()
# setwd("..")
# install("bms2")
```
# Executing the code for Option 1
```{run1, warning=FALSE, message=FALSE, echo=FALSE}
#set the working directory
#ensure the folder bms3 in copied under this working directory you set
setwd("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS\\bms3")
library(devtools)
#bms3::Master(#pass the working directory as input parameter#)
bms3.Master("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS")
```

# Executing the code for Option 2/3
```{run, warning=FALSE, message=FALSE, echo=FALSE}
#set the working directory
#ensure the folder bms2 in copied under this working directory you set
setwd("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS\\bms2")
library(devtools)
document()
setwd("..")
install("bms2")
#bms2::Master(#pass the working directory as input parameter#)
bms2.Master("C:\\Users\\chatt\\OneDrive\\Documents\\BMS_DEVOPS")
```

# Validating results
```{validate, warning=FALSE, message=FALSE, echo=FALSE}
# Ensure the model Rds created in "data" folder
# Ensure all exploratory data analysis plots, Decision Tree, ROC plot are in "graphs" folder
# Ensure the AUC, CUT_OFF, Accuracy, Kappa populated as results on console
# Ensure the sample test data gives row id 14 as Y (probability .782) and rest N. The telemarketer should call this customer for the new product subscription.
```

# Generating the report in Knitr
```{rep, warning=FALSE, message=FALSE, echo=FALSE}
# Report generated in reports folder in project fork
```
# Shiny app: https://praveentestapps.shinyapps.io/bankMarketing/
