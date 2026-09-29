# ==============================================================================
# APM1205: Applied Regression Analysis / Linear Models
# Formative Assessment 4: Dummy-Variable Regression Using Real-World Data
# Bonn Andrei M. Buenaventura
# ==============================================================================

# Load required packages safely
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# Load dataset
data(diamonds)

# ------------------------------------------------------------------------------
# Part A: Exploring and Preparing the Data
# ------------------------------------------------------------------------------
print("--- Part A: Data Dimensions and Structure ---")
dim(diamonds)
str(diamonds)
summary(diamonds)

# Ensure reference category is "Fair" (default R factor ordering for cut)
levels(diamonds$cut)

# ------------------------------------------------------------------------------
# Part C: Additive Dummy-Variable Regression
# ------------------------------------------------------------------------------
print("--- Part C: Additive Model ---")
model1 <- lm(price ~ carat + cut, data = diamonds)
summary(model1)

# Coefficients and specific metrics
round(coef(model1), 3)
summary(model1)$r.squared
summary(model1)$sigma

# ------------------------------------------------------------------------------
# Part D: Interaction Between Carat and Cut
# ------------------------------------------------------------------------------
print("--- Part D: Interaction Model ---")
model2 <- lm(price ~ carat * cut, data = diamonds)
summary(model2)

# ANOVA Table for Model 2
anova(model2)

# Incremental F-test comparing Additive (Model 1) vs Interaction (Model 2)
anova(model1, model2)

# ------------------------------------------------------------------------------
# Part E: Visualization and Export
# ------------------------------------------------------------------------------
# Create figures directory if it doesn't exist
if (!dir.exists("figures")) {
  dir.create("figures")
}

# BULLETPROOF PLOT CODE: 
# Wrapped in parentheses ( ) to prevent Windows line-break parsing errors.
p <- (
  ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
    geom_point(alpha = 0.3) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = "Diamond Price versus Carat by Cut", x = "Carat", y = "Price (US Dollars)", color = "Cut Quality") +
    theme_minimal() +
    theme(legend.position = "bottom")
)

# Save the visualization to figures/
ggsave(filename = "figures/price_vs_carat_by_cut.png", plot = p, width = 7.5, height = 5.5, dpi = 300)

print("SUCCESS! The script finished running and the image is saved in the 'figures' folder.")