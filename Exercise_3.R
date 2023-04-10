## Estimate the percentage of unique samples in a resampled data set generated 
## with replacement

# Define function to calculate percentage of unique samples
unique_samples <- function(N) {
  # Create original data set with N unique data points
  original_data <- 1:N
  # Sample with replacement
  resampled_data <- sample(original_data, N, replace=TRUE)
  # Calculate percentage of unique samples
  unique_percent <- length(unique(resampled_data)) / N * 100
  return(unique_percent)
}

# Set values of N
N <- c(10, 100, 1000, 10000)

# Calculate percentage of unique samples for each value of N
unique_percents <- sapply(N, unique_samples)

# Plot percentage of unique samples as a function of N
plot(N, unique_percents, type="l", xlab="N", ylab="% Unique Samples")

## Draw n = 10000 samples from a normal distribution with a mean of 0.6 and a 
## standard deviation of 1. Plot a histogram of the obtained values and add to 
## the histogram a vertical line at 0.6.

# Set seed for reproducibility
set.seed(100)

# Draw n = 10000 samples from normal distribution with mean 0.6 and sd 1
samples <- rnorm(n = 10000, mean = 0.6, sd = 1)

# Create histogram of samples
hist(samples, xlab = "Values", ylab = "Frequency", col = "lightblue")
abline(v = 0.6, col = "red")


## Draw n = 100 samples from a normal distribution with a mean of 0.6 and a 
## standard deviation of 1. From this data set, generate B = 1000 Boostrap data 
## sets by sampling with replacement and estimate for each of these data sets 
## the sample mean of the data points. Plot a histogram of the resulting mean 
## values

# Set seed for reproducibility
set.seed(100)

# Draw n = 100 samples from normal distribution with mean 0.6 and sd 1
samples <- rnorm(n = 100, mean = 0.6, sd = 1)

# Set sample size
n <- 100
# Set number of bootstrap samples
B <- 1000

# Initialize vector to store bootstrap means
bootstrap_means <- numeric(B)

# Generate B bootstrap samples and calculate mean for each
for (i in 1:B) {
  bootstrap_samples <- sample(samples, size = n, replace = TRUE)
  bootstrap_means[i] <- mean(bootstrap_samples)
}

# Create histogram of bootstrap means
hist(bootstrap_means, xlab = "Sample Mean", ylab = "Frequency", col = "lightblue")

