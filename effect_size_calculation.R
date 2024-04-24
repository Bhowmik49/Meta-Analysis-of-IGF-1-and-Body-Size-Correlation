# Install and load the required packages
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)

# Load the dataset
datum <- read_csv("Dataset_2.csv")

# Convert column names to valid variable names
names(datum) <- make.names(names(datum))

# Remove rows with missing or non-numeric values in Serum.IGF.1 or Body.Weight
datum <- datum %>%
  filter(!is.na(Serum.IGF.1) & !is.na(Body.Weight) &
           !grepl("[^0-9.]", Serum.IGF.1) & !grepl("[^0-9.]", Body.Weight))

# Convert Serum.IGF.1 and Body.Weight to numeric
datum$Serum.IGF.1 <- as.numeric(datum$Serum.IGF.1)
datum$Body.Weight <- as.numeric(datum$Body.Weight)

# Group the data by Animal.model and calculate the correlation coefficients and confidence intervals
results <- datum %>%
  group_by(Animal.model) %>%
  summarize(
    correlation = cor(Serum.IGF.1, Body.Weight, method = "pearson"),
    ci_lower = cor.test(Serum.IGF.1, Body.Weight)$conf.int[1],
    ci_upper = cor.test(Serum.IGF.1, Body.Weight)$conf.int[2],
    sample_size = n()
  )

# Print the results
print(results)

# Save the results as a CSV file
write.csv(results, "correlation_results.csv", row.names = FALSE)
