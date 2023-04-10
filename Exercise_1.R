# Performing a two-sample t-test by testing the hypothesis.

# Set seed for reproducibility
set.seed(200)

# Create samples
n <- c(10, 50, 100)

for (i in n) {
  sample_1 <- rnorm(i, mean=0.3, sd=0.5)
  sample_2 <- rnorm(i, mean=0.7, sd=0.9)
  
  # Perform t-test for H0: µ1 = µ2, H1: µ1 ≠ µ2
  result <- t.test(sample_1, sample_2)
  
  # Print results
  cat("Sample size:", i, "\n")
  cat("t-statistic:", result$statistic, "\n")
  cat("p-value:", result$p.value, "\n")
  cat("\n")
}
