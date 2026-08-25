library(readxl)
library(dplyr)
library(tidyverse)

# Read the private dataset

# The underlying dataset is private and is not included in this repository.
# Replace this placeholder with the local path to the dataset before running.
data_path <- "C:/PATH/TO/YOUR/PRIVATE/CM_ALL_new_modified.xlsx"

CM_ALL <- read_excel(data_path, sheet = "main_ALL")

# Check the data
dim(CM_ALL)
names(CM_ALL)

# First few rows
head(CM_ALL)
