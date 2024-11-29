
##################################################
# Toy example using MCMC for Bayesian inference
##################################################
# How many steps in the Markov chain do we plan to generate: 
N <- 100000

# A vector for storing the simulated markov chain. 
# Its first value (and all other values) is initialized as 
# a random number in the interval from 0 to 1: 
posterior <- rep(runif(1), N)  

# Define a function that is proportional to the posterior density for p: 
f <- function(p) dbinom(4,17,p)*dbeta(p, 2.3, 4.1)

# Simulating the steps of the Markov chain:
for (i in 2:N) {
  # Simulating a proposal: We first generate a number which 
  # may be outside the interval (0,1); then we adjust it 
  # so that it is inside this interval: 
  proposal <- posterior[i-1] + rnorm(1, 0, 0.3)
  proposal <- proposal - floor(proposal)
  
  # Comnpute the acceptance probability: Note that, because the 
  # proposal function above is SYMMETRIC, we get  
  # q("old p" | "new p")/q("new p" | "old p") = 1
  # and that part of the acceptance probability formula disappears. 
  a <- min(1, f(proposal)/f(posterior[i-1]))
  
  # Accept or reject, i.e., determine the next value in the Markov chain: 
  if (runif(1) < a)  
    posterior[i] <- proposal 
  else
    posterior[i] <- posterior[i-1]
}

# Using the Markov chain to (approximately) answer the 
# asked question
print(mean(dbinom(1, 3, posterior)))
# For comparison: In this toy example, we can compute 
# the answer directly (see chapter 1 of compendium): 
print(beta(2.3+4+1, 4.1+17-4+3-1)/
        beta(2.3+4, 4.1+17-4)*choose(3,1))

##################################################
# Second example using MCMC for Bayesian inference
##################################################

#Data: 
x <- c(2,   3,   4,    6,   9)
y <- c(0.32, 0.57, 0.61,  0.83, 0.91)
plot(x,y)

#The expected function: 
f <- function(x,parm) {
  v <- exp(parm*x)
  (v-1)/(v+1)
}
# Illustrating f with various example parameters: 
curve(f(x,1), 0, 10)
points(x,y)
curve(f(x,2), 0, 10, col="red", add=TRUE)
curve(f(x,0.5), 0, 10, col="blue", add=TRUE)
curve(f(x,0.3), 0, 10, col="green", add=TRUE)


# A function proportional to the posterior: 
post <- function(theta1, theta2) {
  prod(dnorm(y, f(x,theta1), theta2))
}

# Illustrating the posterior: 
theta1 <- seq(0.3, 0.5, length.out=100)
theta2 <- seq(0.01, 0.1, length.out=100)
image(theta1, theta2, outer(theta1, theta2, Vectorize(post)))

# Simulate from the posterior
N <- 10000

# Note that each step in the Markov chain is the vaule of a 2D variable theta, 
# so we need a matrix to store our simulated chain: 
result <- matrix(0,N,2)

#Initialize some starting vector: 
result[1,] <- c(0.3, 0.1)

# Simulate the rest of the chain: 
for (i in 2:N) {
  prop <- abs(rnorm(2,result[i-1,], 0.01))
  if (runif(1)<post(prop[1],prop[2])/post(result[i-1,1],result[i-1,2]))
    result[i,] <- prop
  else
    result[i,] <- result[i-1,]
}

# As an illustration, the values of the Markov chain is plotted: 
points(result, type="l")

# Simulate predicted values at x=10: 
xNEW <- 10
yNEW <- numeric(N)
for (i in 1:N) yNEW[i] <- rnorm(1,f(xNEW,result[i,1]),result[i,2])
hist(yNEW)

mean(pnorm(0.98, Vectorize(f)(xNEW,result[,1]), result[,2]))
