library(readxl)
library(dplyr)
library(tidyverse)
library(kableExtra)

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

system(paste(git, "status"))


# Add the modified R script
system(paste(git, "add codes/r_uploads.R"))

# Check what will be committed
system(paste(git, "status"))

# Commit it
system(paste(
  git,
  'commit -m "Update public analysis script"'
))

# Check status again
system(paste(git, "status"))



system(paste(git, "fetch origin"))
system(paste(git, "status"))



# ============================================================
# FINAL CHECK AND PUSH TO GITHUB
# ============================================================

# Show whether local main differs from GitHub's main
system(paste(git, "status -sb"))

# Show commits that are local and not yet on GitHub
system(paste(git, "log origin/main..main --oneline"))

# Show files in the latest commits
system(paste(git, "status"))

# If everything looks correct, push to GitHub
system(paste(git, "push -u origin main"))

# Final verification
system(paste(git, "status -sb"))




# Go to your project
setwd("C:/Users/210185/Downloads/india_cms_analysis")

# Git location
git <- '"C:/Program Files/Git/cmd/git.exe"'

# 1. Count lines in the file currently SAVED on your computer
length(readLines("codes/r_uploads.R"))

# 2. Check whether the local file has changes not yet uploaded
system(paste(git, "status"))

# 3. See exactly what Git thinks has changed
system(paste(git, "diff -- codes/r_uploads.R"))

# 4. Check the number of lines in the version currently committed
system(paste(
  git,
  'show HEAD:codes/r_uploads.R | find /v /c ""'
))


###Basic Facts about Chief Ministers

#####Longest Serving CMS####

longest_serving <- CM_ALL %>%
  group_by(cm) %>%
  summarise(
    Days = sum(Days),
    .groups = "drop"
  ) %>%
  mutate(
    Rank = dense_rank(desc(Days))
  ) %>%
  filter(Rank %in% 1:10) %>%
  arrange(Rank)

write.csv(
  longest_serving,
  "tables/ten_longest_serving_cms_india.csv",
  row.names = FALSE
)


list.files("tables")
file.exists("tables/ten_longest_serving_cms_india.csv")


















