# r-data-generator
Two sets of R scripts for creating statistically significant and insignificant data illustrations for bivariate regressions, difference-of-means tests.

## File Description
1. `reg/preamble-reg.R` defines the parameters for the scripts in this package. Change the variables accordingly to match your own research
2. `reg/null-reg.R` generates a dataset where there is no significant relationship between the two variables
3. `reg/datagen-reg.R` randomly generates a 20-point dataset with high r-squared value and low p-value.
4. `reg/interpolate-reg.R` generates 80 extra data points using the principal dataset in Step 1, while maintaining its high R2 value. (this part is deliberately separated from step 3 for the user to test different interpolation models without resetting the principal dataset)
5. `reg/combined-reg.R` combines (3) and (4) for those who don't want the hassle of running two separate scripts.
---
1. `bar/preamble-b.R` defines the parameters for scripts for this package. Change the variables accordingly to match your own research
2. `bar/null-b.R` generates a bar graph where no significant difference is detected across the groups
3. `bar/sig-b.R` generates a bar graph with significant differences in the means of the data groups. Averages are sorting in ascending order, according to the order that the groups are defined in the `xlabels` parameter.

## Dependencies:
* Regression package dependencies (run `reg/dependencies-setup-reg.R` to install and setup)
  * `maptools`
  * `jtools`
  * `stargazer`
* Bar graph package Dependencies (run `reg/dependencies-setup-b.R` to install and setup)
  * `ggplot2`
  * `dplyr`
  * `pander`
  * `Pandoc` (requires restart after install)

## Please cite as:
* Koo, J (2020). *R data generation script*. Version 0.0.3. (Available at: https://github.com/tanxpyox/r-data-generator)

## Q&A
Why create this script? Is this created to do sketchy stuff?
* A: No, this was originally created to complete my politics coursework, which required me to present two different hypothetical datasets, where I (i) fail to reject or (ii) can reject with confidence the null hypothesis. I ask that all users of this script to abide by the academic standards of ethics and *indicate that the dataset is only hypothetical and created for illustration.*

Will more data patterns be added?
* A: Sure, leave your suggestions in the issues tab

Will this be available as a R package?
* A: I currently have no plans of making this into a package, partly because this code is still very crude and will need some major rewriting to accomodate for all possible users.--But, maybe with your help, I can!

## Licence
* The scripts in this repo are released under the GPL 3.0 licence. See LICENSE for the full terms and conditions.
