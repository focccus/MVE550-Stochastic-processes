# Set parameters for the Negative Binomial distribution
alpha <- 88
beta <- 6
p <- beta / (1 + beta)  # probability of success for Negative Binomial

# Generate values for y7 (number of requests)
y7_values <- 0:50  # range of possible values for requests on the 7th day

# Calculate the probability mass function for the Negative Binomial distribution
predictive_distribution <- dnbinom(y7_values, size = alpha, prob = p)

print(predictive_distribution[18+1])

# Plot the predictive distribution
plot(y7_values, predictive_distribution, type = "h", 
     main = "Predictive Distribution for Number of Requests on 7th Day",
     xlab = "Number of Requests (y7)", 
     ylab = "Probability", 
     col = "purple", lwd = 2)
