# APM1205_FA4_Buenaventura
# Dummy-Variable Regression on Diamond Pricing

An applied regression analysis using R to evaluate how carat weight and cut quality jointly influence diamond prices in the `ggplot2::diamonds` dataset. 

This project explores:
* **Indicator Coding & Multicollinearity**: Establishing a baseline (`Fair` cut) to prevent the dummy variable trap across 53,940 observations.
* **Additive Modeling**: Estimating baseline price premiums and parallel valuation slopes across cut qualities ($R^2 \approx 0.8565$).
* **Interaction Effects**: Conducting an incremental $F$-test ($F = 176.26, p < 0.001$) to demonstrate that higher-quality cuts appreciate at significantly steeper rates per carat.

Includes reproducible R code (`.R`), an R Markdown report (`.Rmd`), and exported regression visualizations.
