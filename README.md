# r-data-generator
Two R scripts for creating large bivariate datasets with significant R2 values. 

**Note**: 
* The two scripts are originally created to illustrate the hypothetical statistical relationship between Online forum usage `online` (the independent variable) and the levels of Social Capital `scap` (the dependent variable). Please change the variable names according to your own research. 

**Mechanism**
1. `gendata.R` randomly generates a small dataset with high r-squared value and low p-value.
2. `highR2.R` generates extra data points using the principal dataset in Step 1, while maintaining its high R2 value.

**Dependencies**:
* `maptools`
* `jtools`

**Please cite as**:
* Koo, J (2020). *R data generation script*. Version 0.0.1.
