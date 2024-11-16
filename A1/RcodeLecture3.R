
# Computation of result for comparison with sections below: 
print(choose(3,1)*beta(6.3+1, 17.1+3-1)/beta(6.3,17.1))


######################
# Example in section 1.5 i compendium: 
######################

# Discrete computation: 
p <- seq(0, 1, length.out=20)
a <- dbeta(p, 2.3, 4.1)
a <- a/sum(a)
b <- dbinom(4, 17, p)
c <- a*b
c <- c/sum(c)
d <- dbinom(1, 3, p)
sum(c*d)

# Simplifying the code above: 
p <- seq(0, 1, length.out=20)
a <- dbeta(p, 2.3, 4.1)
b <- dbinom(4, 17, p)
c <- a*b/sum(a*b) #No need to divide a by its sum before this step
d <- dbinom(1, 3, p)
sum(c*d)

# Code used in section 1.6 of the Compendium: 
f1 <- function(theta) {dbinom(1, 3, theta)*dbinom(4, 17, theta)*
    dbeta(theta, 2.3, 4.1)}
f2 <- function(theta) {dbinom(4, 17, theta)*dbeta(theta, 2.3, 4.1)}
integrate(f1, 0, 1)$value/integrate(f2, 0, 1)$value

