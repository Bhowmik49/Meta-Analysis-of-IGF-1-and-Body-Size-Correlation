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

## Usage

1. Clone the repository: `git clone https://github.com/yourusername/igf1-body-size-meta-analysis.git`
2. Install the required R packages: `metafor`, `readr`, `dplyr`, `readxl`, `psych`
3. Run the R scripts in the `code/` directory to reproduce the analysis

## Citation

If you use the data or code from this repository, please cite the original publication:

Bhowmik, S., Schwartz, T., & Wilson, A. (2024). A Meta-Analysis of IGF-1 Protein Concentration and Body Size Correlation Across Diverse Animal Models. [Journal Name], [Volume](Issue), [Page Range].

## Contact

For questions or inquiries, please contact the corresponding author:
Sagar Bhowmik (szb0232@auburn.edu)
