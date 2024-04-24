# Install and load the required packages
install.packages("readxl")
install.packages("psych")
library(readxl)
library(psych)

# Load the dataset
datum <- read_excel(file.choose())

# Convert column names to valid variable names
names(datum) <- make.names(names(datum))

# Print the first few rows of the dataset
head(datum)

# Get unique animal models
animal_models <- unique(datum$Animal.model)

# Create an empty data frame to store the results
results <- data.frame(
  animal_model = character(),
  correlation = numeric(),
  lower_ci = numeric(),
  upper_ci = numeric(),
  sample_size = numeric(),
  stringsAsFactors = FALSE
)

# Loop through each animal model
for (model in animal_models) {
  # Subset the data for the current animal model
  subset_data <- datum[datum$Animal.model == model, ]
  
  # Select the relevant columns and remove missing data
  IGF_1 <- subset_data$Serum.IGF.1
  body_size <- subset_data$Body.Weight
  
  # Remove any non-numeric characters from IGF_1 and body_size
  IGF_1 <- as.numeric(gsub("[^0-9.-]", "", IGF_1))
  body_size <- as.numeric(gsub("[^0-9.-]", "", body_size))
  
  # Remove rows with missing values in either IGF_1 or body_size
  valid_data <- complete.cases(IGF_1, body_size)
  IGF_1 <- IGF_1[valid_data]
  body_size <- body_size[valid_data]
  
  # Calculate Pearson's correlation coefficient
  correlation <- cor(IGF_1, body_size, method = "pearson")
  
  # Calculate the 95% confidence interval using Fisher's Z transformation
  ci <- r.con(correlation, length(IGF_1), level = 0.95)
  
  # Add the results to the data frame
  results <- rbind(results, data.frame(
    animal_model = model,
    correlation = correlation,
    lower_ci = ci$lower,
    upper_ci = ci$upper,
    sample_size = length(IGF_1)
  ))
}

# Print the results
print(results)
# Save the prepared data to a CSV file for further analysis
write.csv (results, "effect_sizes.csv", row.names = FALSE)

