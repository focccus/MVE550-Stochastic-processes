
#### Example 1: 

Q <- matrix(c(0, 1, 0, 
              0, 0, 0.5, 
              0.5, 0, 0), 3, 3, byrow=T)
R <- matrix(c(0, 0, 
              0.5, 0, 
              0, 0.5), 3, 2, byrow=T)
F <- solve(diag(3)-Q)
print(F)
print(F%*%R)

#########################################
# Example finding the sequence HTTH: 
#########################################

Q <- matrix(c(1, 1, 0, 0, 
              0, 1, 1, 0, 
              0, 1, 0, 1, 
              1, 0, 0, 0)/2, 4, 4, byrow=T)

F <- solve(diag(4)-Q)

print(sum(F[1,]))

##########################################


# Simulate and plot a Branching process with a given a: 
a <- c(1/4, 1/4, 1/4, 1/4)
maxchildren <- length(a)-1

# Expected number of children: 
print(sum(a*(0:maxchildren)))

# Set up a plot with some limitations
# Number of generations simulated: 
n <- 8
# Assumed maximum size of a generation: 
maxsize = 20
plot(1:n, c(0, rep(maxsize, n-1)), type="n", 
     xlab="generation", ylab="Gen.size")

result <- c(1, rep(0, n-1))
for (i in 2:n) {
  for (j in 1:result[i-1]) {
    children <- sample(0:maxchildren, 1, prob=a)
    if (children >0) {
      for (k in 1:children) {
        result[i] <- result[i] + 1
        lines(c(i-1,i), c(j, result[i]))
      }
    }
  }
  if (result[i]==0) {
    print("Extinct!")
    break
  }
}


#### Code for plot of G(s)

n <- 10
G <- Vectorize(function(s) {sum(s^(0:n)*dbinom(0:n, n, 0.2))  })
curve(G(x))
abline(a=0, b=1)

