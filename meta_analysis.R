# Install and load the metafor package
install.packages("metafor")
library(metafor)

# Load the correlation results from the CSV file
results <- read.csv("correlation_results.csv")

# Convert correlation coefficients to Fisher's z scale
results$fisher_z <- atanh(results$correlation)

# Calculate the standard error of Fisher's z
results$se <- 1 / sqrt(results$sample_size - 3)

# Conduct the meta-analysis using a random-effects model
meta_model <- rma(yi = fisher_z, sei = se, data = results, method = "REML")

# Print the results of the meta-analysis
print(meta_model)

# Assess heterogeneity using the Q-test and I^2 statistic
print(meta_model$QE)  # Q-test statistic and p-value
print(meta_model$I2)   # I^2 statistic


forest(meta_model)
funnel(meta_model)
### Save the results as a CSV file
write.csv(results, "meta_model.csv")


meta_model <- rma(yi = fisher_z, sei = se, data = results, method = "REML")
forest(meta_model, slab = results$Animal.model)

funnel(meta_model, main = "Funnel Plot of Correlation between IGF-1 and Body Weight",
       xlab = "Correlation Coefficient", ylab = "Standard Error",
       level = c(0.1, 0.05, 0.01), shade = c("white", "gray75", "gray45"), legend = TRUE)

# Get the coordinates of the studies in the funnel plot
coords <- funnel(meta_model)$coords

# Add text labels for animal models
text(coords[3, "xi"], coords[3, "sei"], "Mice", pos = 2, cex = 0.8)
text(coords[2, "xi"], coords[2, "sei"], "Dairy Cow", pos = 4, cex = 0.8)
text(coords[1, "xi"], coords[1, "sei"], "Chickens", pos = 4, cex = 0.8)

forest(meta_model, slab = results$Animal.model,
       main = "Forest Plot of Correlation between IGF-1 and Body Weight",
       xlim = c(-2, 2), alim = c(-2, 2),
       xlab = "Correlation Coefficient",
       ilab = cbind(results$correlation, results$ci_lower, results$ci_upper),
       ilab.xpos = c(-1.5, -1, -0.5), ilab.pos = 2,
       cex = 0.8)




# Before calling forest, set the margins to allow for a longer title
# The 'mar' parameter sets the bottom, left, top, and right margins respectively
par(mar=c(5, 4, 4, 2) + 0.1) # Increase the top margin to allow more space for the title

# Call the forest function with adjusted settings
forest(meta_model, slab = results$Animal.model,
       main = "Forest Plot of Correlation between IGF-1 and Body Weight")
forest(meta_model, slab = results$Animal.model,
       main = "Forest Plot of Correlation between IGF-1 and Body Weight")

funnel(meta_model, main = "Funnel Plot of Correlation between IGF-1 and Body Weight",
       xlab = "Correlation Coefficient", ylab = "Standard Error",
       level = c(0.1, 0.05, 0.01), shade = c("white", "gray75", "gray45"), legend = TRUE)



data <- data.frame(
  animal_model = c("Chickens", "Dairy Cow", "Mice"),
  effect_size = c(0.89, 0.79, -0.85),
  standard_error = c(0.38, 0.14, 0.09)
)

funnel(meta_model, main = "Funnel Plot of Effect Sizes by Animal Model",
       xlab = "Effect Size", ylab = "Standard Error",
       level = c(0.1, 0.05, 0.01), shade = c("white", "gray75", "gray45"), legend = TRUE)
text(data$effect_size, data$standard_error, labels = data$animal_model, pos = 3, cex = 0.8)

install.packages("metafor")
library(metafor)

data <- data.frame(
  animal_model = c("Chickens", "Dairy Cow", "Mice"),
  effect_size = c(0.89, 0.79, -0.85),
  standard_error = c(0.38, 0.14, 0.09)
)

meta_model <- rma(yi = effect_size, sei = standard_error, data = data)

funnel(meta_model, main = "Funnel Plot of Effect Sizes by Animal Model",
       xlab = "Effect Size", ylab = "Standard Error",
       level = c(0.1, 0.05, 0.01), shade = c("white", "gray75", "gray45"), legend = TRUE)

text(data$effect_size, data$standard_error, labels = data$animal_model, pos = 3, cex = 0.8)
