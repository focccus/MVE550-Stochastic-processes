# MVE550 Assignment 1

## 1 Inference 

### a) 
$$
Gamma(\lambda; 0, 0) \propto \frac{1}{\lambda}
$$
[[Poisson Distribution]] is conjugate to [[Gamma Distribution]] $Gamma(\theta; \alpha + k, \beta +1)$

### b) 
$$
\pi(y_{new} | y) = \frac{\pi(y_{new} | \theta) \pi(\theta | y)}{\pi(\theta | y_{new}, y)}
$$
## 2 Markov Chains 
Idea: Implement a final state that cannot be escaped. 
### a) Expected number of dice throws before final winning throw. 

$$
E[X] = \sum_{x = 0}^\infty x \pi(X = x) = 1 P(x_{1} = 6 |  x_{0} = 6) + 2 P(x_{2} = 6 |  x_{0} = 6) \dots = \sum_{t = 1}^t t P_{66}^t
$$

### b) Probability of visiting 3 before end of the game. 
V: number of visits of 3 
$$
P(V = 1 | x_{T} = 6) = \sum_{t=1}^{T-1} P(x_{t} = 3 |x_{0} = 6) P(x_{T} = 6 |x_{t} = 3) 
$$

If [[Recurrent Markov Chain]], then this Probability is 1 (probably not in our case). 
### c) Probability of visiting 3 more than once 
$$
P(V \geq 2) = P(V = 2) + P(V = 3) + \dots 
$$