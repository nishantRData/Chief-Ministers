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


options(repos = c(CRAN = "https://cloud.r-project.org"))

available.packages()["usethis", "Version"]

# ============================================================
# GITHUB / GIT CHECK FROM RSTUDIO
# ============================================================

# 1. Go to your project folder
setwd("C:/Users/210185/Downloads/india_cms_analysis")

# Confirm location
getwd()


# 2. Exact location of Git
git <- '"C:/Program Files/Git/cmd/git.exe"'


# 3. Check Git version
system(paste(git, "--version"))


# 4. Check current repository status
system(paste(git, "status"))


# 5. Show recent commit history
system(paste(git, "log --oneline --all --graph -10"))


# 6. Check GitHub remote
system(paste(git, "remote -v"))


# 7. Check branches
system(paste(git, "branch -a"))


# 8. Download latest information from GitHub
# This does NOT upload or change your files
system(paste(git, "fetch origin"))


# 9. Check status again
system(paste(git, "status"))



git <- '"C:/Program Files/Git/cmd/git.exe"'

setwd("C:/Users/210185/Downloads/india_cms_analysis")

system(paste(
  git,
  'commit -m "Merge latest changes from GitHub"'
))







