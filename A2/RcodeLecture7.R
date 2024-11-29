
# Toy example: 
# The transition matrix 
P <- matrix(c(0.99, 0.01, 0, 0, 0.9, 0.1, 0.2, 0, 0.8), 3, 3, byrow=T)

# One way to find the limiting distribution is the following:
# vP = v gives v(P-I) = 0: The COLUMNS of P-I give 3 DEPENDENT equations. 
# To get 3 independent equations, we replace the first with v1+v2+v3=1.
# In other words, replace the first column of P-I with ones; we then 
# want the v such that v%*%P1 = c(1, 0, 0). 
# Remember that solve(...) inverts a matrix in R. Thus we compute
P1 <- P - diag(3)
P1[,1] <- 1
v <- c(1, 0, 0)%*%solve(P1)
print(v)
# Solving this manually, we may easily compute 
# that v = c(20/23, 2/23, 1/23). 

# Computing E[r(X)] directly, when probabilities 
# of 0, 1, 2 are 20/23, 2/23, 1/23, respectively: 
print(0^5*20/23 + 1^5*2/23 + 2^5*1/23)
# Computing manually we see that the answer is 34/23. 

N <- 1000
# Estimating the result using a sample: 
simIndep <- function() {
  X <- replicate(N, sample(c(0,1,2), 1, prob = v))
  mean(X^5)
}

print(simIndep())

# Estimating the result using a Markov chain: 
simMarkov <- function() {
  Y <- rep(0, N) 
  # start chain randomly
  Y[1] <- sample(c(0,1,2),1)
  for (i in 2:N) Y[i] <- sample(c(0,1,2), 1, prob = P[Y[i-1]+1,])
  mean(Y^5)
}

print(simMarkov())

# Compare the spread of the results of the two methods: 
hist(replicate(1000, simIndep()), breaks=20)
hist(replicate(1000, simMarkov()), breaks=20)


