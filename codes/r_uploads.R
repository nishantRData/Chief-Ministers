# ============================================================
# CHIEF MINISTERS OF INDIA: ANALYSIS
# ============================================================

# This script reads a private dataset stored locally.
# The underlying dataset is not included in this public repository.


# ============================================================
# 1. LOAD PACKAGES
# ============================================================

library(readxl)
library(dplyr)


# ============================================================
# 2. READ PRIVATE DATASET
# ============================================================

# Replace this with the local path to your private dataset.
data_path <- "C:/PATH/TO/YOUR/PRIVATE/CM_ALL_new_modified.xlsx"

CM_ALL <- read_excel(
  data_path,
  sheet = "main_ALL"
)


# ============================================================
# 3. BASIC DATA CHECKS
# ============================================================

dim(CM_ALL)
names(CM_ALL)
head(CM_ALL)


# ============================================================
# 4. BASIC FACTS ABOUT CHIEF MINISTERS
# ============================================================


# ------------------------------------------------------------
# Table 1: Ten longest-serving Chief Ministers in India
# ------------------------------------------------------------

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


# ------------------------------------------------------------
# Table 2: Number of Chief Ministers by party
# ------------------------------------------------------------

partywise_CMs <- CM_ALL %>%
  group_by(party) %>%
  summarise(
    `Number of CMs` = n(),
    .groups = "drop"
  )

write.csv(
  partywise_CMs,
  "tables/partywise_number_of_CMs.csv",
  row.names = FALSE
)


# ------------------------------------------------------------
# Table 3: Female Chief Ministers in India
# ------------------------------------------------------------

female_cms <- CM_ALL %>%
  filter(Gender == "F") %>%
  select(
    cm,
    State,
    From,
    To,
    party,
    Caste,
    Category
  )

write.csv(
  female_cms,
  "tables/genderwise_number_of_CMs.csv",
  row.names = FALSE
)


# ------------------------------------------------------------
# Table 4: Number of times each Chief Minister took oath
# ------------------------------------------------------------

oath <- CM_ALL %>%
  group_by(cm) %>%
  summarise(
    Number_of_terms = n(),
    .groups = "drop"
  ) %>%
  mutate(
    Rank = dense_rank(desc(Number_of_terms))
  ) %>%
  arrange(Rank)

write.csv(
  oath,
  "tables/number_of_terms.csv",
  row.names = FALSE
)


# ============================================================
# 5. AGE AT APPOINTMENT
# ============================================================


# ------------------------------------------------------------
# Table 5: Median and mean age at appointment across decades
# ------------------------------------------------------------

age <- CM_ALL %>%
  group_by(decades) %>%
  summarise(
    Median_age = median(age_appointment, na.rm = TRUE),
    Mean_age = mean(age_appointment, na.rm = TRUE),
    .groups = "drop"
  )

write.csv(
  age,
  "tables/medianMean_appointment_age.csv",
  row.names = FALSE
)

###Ten oldest CMs at the time of retirement

oldest_cms<-CM_ALL%>%ungroup()%>%
mutate(Rank=dense_rank(desc(age_retirement)))%>%filter(Rank%in%c(1:20))%>%
  select(cm,State,From,To,age_appointment)%>%arrange(age_appointment)


write.csv(oldest_cms,
  "tables/Oldest_20_CMs_age.csv",
  row.names = FALSE)


##Castewise List of CMs

caste<-CM_ALL%>%ungroup()%>%group_by(Caste)%>%summarise(Number_of_CMs=n())%>%
  arrange(desc(Number_of_CMs))


write.csv(caste,
          "tables/Castewise_number_CMs.csv",
          row.names = FALSE)




