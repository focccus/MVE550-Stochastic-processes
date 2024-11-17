# Set the parameters for the Gamma distribution
alpha <- 88
beta <- 6

# Define a sequence of values for lambda (x-axis values)
lambda <- seq(0, 30, length.out = 1000)

# Calculate the density of the Gamma distribution
gamma_density <- dgamma(lambda, shape = alpha, rate = beta)

# Plot the Gamma distribution
plot(lambda, gamma_density, type = "l", 
     main = "Gamma Distribution (alpha = 88, beta = 6)", 
     xlab = expression(lambda), 
     ylab = "Density",
     col = "blue", lwd = 2)
