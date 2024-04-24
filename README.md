# Meta-Analysis of IGF-1 and Body Size Correlation

This repository contains the data and code for the meta-analysis conducted in the study "A Meta-Analysis of IGF-1 Protein Concentration and Body Size Correlation Across Diverse Animal Models" by Sagar Bhowmik, Tonia Schwartz, and Alan Wilson.

## Contents

- `data/`: Contains the raw data files used in the analysis
  - `Dataset_2.csv`: Raw data used for effect size calculations
  - `correlation_results.csv`: Correlation analysis results for each animal model
  - `meta_model.csv`: Meta-analysis results
  - `effect_sizes.csv`: Prepared data for subgroup analysis
- `code/`: Contains the R scripts for data preprocessing, analysis, and visualization
  - `effect_size_calculation.R`: Script for calculating correlation coefficients and confidence intervals
  - `meta_analysis.R`: Script for conducting the meta-analysis and creating forest and funnel plots
  - `subgroup_analysis.R`: Script for performing subgroup analysis
- `plots/`: Contains the generated forest and funnel plots
  - `forest_plot.png`: Forest plot visualizing the effect sizes and confidence intervals for each animal model
  - `funnel_plot.png`: Funnel plot assessing publication bias

## Usage

1. Clone the repository: `git clone https://github.com/yourusername/igf1-body-size-meta-analysis.git`
2. Install the required R packages: `metafor`, `readr`, `dplyr`, `readxl`, `psych`
3. Run the R scripts in the `code/` directory to reproduce the analysis
4. The generated forest and funnel plots can be found in the `plots/` directory

## Plots

### Forest Plot
The forest plot visualizes the effect sizes (correlation coefficients) and their 95% confidence intervals for each animal model. It provides a comprehensive overview of the relationship between IGF-1 and body size across the included studies.

### Funnel Plot

The funnel plot assesses potential publication bias in the meta-analysis. It displays the effect sizes against their standard errors, with the expected funnel shape indicating the absence of publication bias. Asymmetry in the funnel plot may suggest the presence of publication bias.


## Contact

For questions or inquiries, please contact:
Sagar Bhowmik (szb0232@auburn.edu)
