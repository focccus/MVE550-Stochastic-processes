# Define a vector of observed counts
observed_k <- c(12, 21, 12, 13, 11, 19)  # example data

# Parameters of the posterior Gamma distribution
alpha <- 88
beta <- 6

# Number of discretization points
n_points <- 100  # You can adjust this for higher accuracy

# Discretize the range of lambda
lambda_values <- seq(0, 30, length.out = n_points)  # Choose an appropriate range for lambda
delta_lambda <- diff(lambda_values)[1]  # Calculate the step size

prior_density <- dgamma(lambda_values, shape = 0, rate = 0)

likelihood_density <- sapply(lambda_values, function(l) prod(dpois(observed_k, lambda = l)))
print(likelihood_density)

y7 <- 18  
predictive_probabilities <- dpois(y7, lambda = lambda_values)

# Compute the weighted sum to approximate the predictive probability
predictive_distribution <- sum(predictive_probabilities * posterior_density) * delta_lambda

# Print the result
cat("Approximate probability of exactly 18 requests on the 7th day:", predictive_distribution, "\n")
