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

Given by sum of entries in the first row of the fundamental matrix
$$
a_0 = \sum F_{0k}
$$

### b) Probability of visiting 3 before end of the game. 

Maybe make 3 an absorbing state as well?
FR_1 gives the probabilities of absorbtion when starting from 0.


P(V = 1) = P(visit 3 at least once) P(visit 3 never again when starting in 3)
         =      P(visit 3 at least once) (1/4 + 1/4 P(visit 3 never again when starting in 4)+ 2/4 P(visit 3 never again when starting in 1)

$$
P(V = 1, X_0 = 0) = P(V \geq 1| X_0 = 0)P(V =  0 | X_0 = 3) = P(V \geq 1 | X_0 = 0)(\frac{1}{4} + \frac{1}{4} P(V = 0 | X_0 = 4) + \frac{2}{4} P(V=0 | X_0 = 1))
$$

V: number of visits of 3 
$$
P(V = 1 | x_{T} = 6) = \sum_{t=1}^{T-1} P(x_{t} = 3 |x_{0} = 6) P(x_{T} = 6 |x_{t} = 3) 
$$

$$
P(V = 1) = P(\sum_{n=0}^n I_n = 1) = \sum_{n=0}^\infty P(X_n = 3) \prod_{i = 0, i \neq n}^\infty P(X_i  \neq 3)
$$


If [[Recurrent Markov Chain]], then this Probability is 1 (probably not in our case). 
### c) Probability of visiting 3 more than once 
$$
P(V \geq 2) = P(V = 2) + P(V = 3) + \dots = 1 - P(V = 0) + P(V = 1)
$$

Idea for V=0: make 3 absorbing state and calculate the probability of absorbtion in 6