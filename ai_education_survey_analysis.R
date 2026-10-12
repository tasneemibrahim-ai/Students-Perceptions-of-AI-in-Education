# =============================================================================
# Students' Perceptions of AI in Education — Statistical Analysis
# =============================================================================
# Course  : Probability (Spring 2024)
# Author  : Tasneem Ibrahim Hassan Mohamed
# Tools   : R 4.2+, moments (for skewness)
# =============================================================================

# --- 0. Load Required Libraries ----------------------------------------------
# install.packages("moments")   # uncomment on first run
library(moments)

# --- 1. Load the Dataset -----------------------------------------------------
# The dataset is a CSV survey collected from undergraduate students enrolled
# in the 2nd and 3rd year of study from the Faculty of Cybernetics, Statistics
# and Economic Informatics across various universities worldwide.
# Update the path below to point to your local copy of the CSV file.

# af <- read.csv("AI_survey_data.csv")   # uncomment and set your path
# View(af)

# --- 2. Define the Survey Response Vector ------------------------------------
# Q1: "How familiar are you with AI technologies?" (scale 1–10)
Q1 <- c(8, 7, 5, 5, 4, 5, 7, 6, 6, 4,
         4, 6, 9, 9, 7, 6, 1, 8, 7, 6,
         6, 7, 7, 5, 4, 5, 7, 3, 6, 5,
         5, 6, 5, 7, 6, 8, 10, 8, 7, 7,
         7, 5, 8, 5, 6, 3, 8, 7, 9, 7,
         3, 4, 7, 5, 5, 6, 5, 8, 4, 5,
         6, 4, 8, 6, 7, 5, 8, 1, 6, 4,
         9, 10, 8, 6, 5, 4, 7, 4, 4, 8,
         8, 3, 7, 5, 6, 1, 8, 6, 9, 2, 2)

# --- 3. Descriptive Statistics ------------------------------------------------
cat("========== Descriptive Statistics ==========\n")
cat("Mean              :", mean(Q1), "\n")
cat("Median            :", median(Q1), "\n")
cat("Standard Deviation:", sd(Q1), "\n")

# Custom mode function (R has no built-in mode for numeric vectors)
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
cat("Mode              :", getmode(Q1), "\n")

# --- 4. Interquartile Range & Skewness ----------------------------------------
cat("\n========== Spread & Shape ==========\n")
cat("IQR      :", IQR(Q1), "\n")
cat("Skewness :", skewness(Q1), "\n")

# --- 5. Visualisations --------------------------------------------------------

# 5a. Histogram of Q1 (AI familiarity scores)
hist(Q1,
     main = "Histogram of Q1 — AI Familiarity",
     xlab = "Q1 (Familiarity Score)",
     ylab = "Frequency",
     col  = "steelblue",
     border = "white")

# 5b. Box plot of Q1
boxplot(Q1,
        main = "Box Plot of Q1 — AI Familiarity",
        ylab = "Familiarity Score",
        col  = "lightblue")

# --- 6. Sectoral Impact Analysis ---------------------------------------------
# Students were asked: "In which area do you think AI would have a big impact?"
# Responses are binary (0 = No, 1 = Yes) for each sector.

cat("\n========== Sectoral AI Impact — Summary Statistics ==========\n")

# The dataset columns for sectors (loaded from the CSV) include:
#   Education, Medicine, Agriculture, Constructions, Marketing,
#   Administration, Art
# Below we print summaries if the full dataframe (af) is loaded:

# summary(af[, c("Education","Medicine","Agriculture","Constructions",
#                "Marketing","Administration","Art")])

# Histograms for highest- and lowest-impact sectors
# hist(af$Medicine,     main = "Histogram of Medicine",     col = "coral")
# hist(af$Art,          main = "Histogram of Art",          col = "lightgreen")

# --- 7. Filtering by GPA (Highest-Performing Students) ------------------------
# Identify the student with the highest GPA and examine their survey responses.

# x1 <- af[13, 35]       # specific cell
# x1 <- af[13, ]         # full row for student ID 13
# View(x1)

# x2 <- af[59, ]         # another high-GPA student
# x3 <- af[61, ]         # another high-GPA student

# Convert to list for inspection:
# x1list <- list(unlist(x1))
# print(x1list)

cat("\n========== Analysis Complete ==========\n")
