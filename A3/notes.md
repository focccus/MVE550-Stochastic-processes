## a) Find the posterior for $\tilde P$. Compute the expectation 
*The transition matrix  $\tilde P$ of the embedded chain is unknown, and we will  
use data from Figure 1 to learn about it. Let $\tilde P_{1}, \tilde P_{2}, \tilde P_{4}$, and $\tilde P_{4}$ be the  
four rows of $\tilde P$. \
Find the posterior given the data in the figure: Express the posterior using  
parametric distributions with explicit parameters. Compute the expected  
value of this posterior distribution.*


given the data in the figure and compute the expected value of this posterior distribution
For this task we just look at the embedded discrete chain.
We are given 20 observations $x_{0}, \dots, x_{20}$ in the state space $\{ 1,2,3,4 \}$. 
The likelyhood can be formulated as: 

$$
\pi(x_{0}, \dots, x_{20} | \tilde P) = \pi(x_{0}) \prod_{r=1}^{20} \pi(x_{r} | x_{r-1}, \tilde P) = \pi(x_{0}) \prod_{r=1}^{20} \tilde P_{x_{r-1}, x_{r}} = \pi(x_{0}) \prod_{i=k}^4 \prod_{j=1}^4 (P_{ij})^{c_{ij}}
$$

The following values $c_{ij}$ give the count of transition between 2 states $i,j$:

| $c_{ij}$ | **1** | **2** | **3** | **4** |
| -------- | ----- | ----- | ----- | ----- |
| **1**    | 0     | 2     | 0     | 5     |
| **2**    | 4     | 0     | 1     | 0     |
| **3**    | 0     | 0     | 0     | 1     |
| **4**    | 2     | 3     | 0     | 0     |

For the rows of $\tilde P$, we are given the priors: 
$$
\begin{array}{l l l}{{\displaystyle\tilde{P}_{1}}}&{{\sim}}&{{\mathrm{Dirichlet}(0,1,1,1)}}\\ {{\tilde{P}_{2}}}&{{\sim}}&{{\mathrm{Dirichlet}(1,0,1,1)}}\\ {{\displaystyle\tilde{P}_{3}}}&{{\sim}}&{{\mathrm{Dirichlet}(1,1,0,1)}}\\ {{\displaystyle\tilde{P}_{4}}}&{{\sim}}&{{\mathrm{Dirichlet}(1,1,1,0)}}\end{array}
$$
So the Prior for $\tilde P$ can be formulated as: 
$$
\pi(\tilde P) = \prod_{i=1}^4 \mathrm{Dirichlet}(\tilde P_{i}; \alpha_{i}) \propto \prod_{i=1}^4 \prod_{j=1}^4 (P_{ij})^{\alpha_{ij} - 1}
$$
So for the posterior we see: 

$$
\begin{align}
\pi(\tilde P | x_{0}, \dots x_{20}) &\propto \pi(x_{0}, \dots, x_{20} | \tilde P) \pi(\tilde P) \\
&\propto \prod_{i=k}^4 \prod_{j=1}^4 (P_{ij})^{c_{ij}} \prod_{i=1}^4 \prod_{j=1}^4 (P_{ij})^{\alpha_{ij} - 1} \\
&\propto \prod_{i=1}^4 \prod_{j=1}^4 (P_{ij})^{c_{ij} + \alpha_{ij} - 1} 
\propto \prod_{i=1}^4 \mathrm{Dirichlet}( \tilde P_{i}; \alpha_{i} + c_{i})
\end{align}
$$
Thus the posterior is given by the distribution 
$$
\pi(\tilde P | x_{0}, \dots x_{20}) = \mathrm{Dirichlet}( \tilde P_{1}; 0, 3, 1, 6) \mathrm{Dirichlet}( \tilde P_{2}; 5, 0, 2, 1) \mathrm{Dirichlet}( \tilde P_{3}; 1,1,0,2) \mathrm{Dirichlet}( \tilde P_{4}; 3,4,1,0)
$$
The expectation for one entry of a Dirichlet Distribution is given by: 
$$
E[\tilde P_{ij}] = E[\mathrm{Dirichlet}( \tilde P_{i}; \alpha_{i})_{j}] = \frac{a_{ij}}{\sum_{k=1}^4 \alpha_{ik}}
$$

## b) Obtain a posterior distribution for q. Compute the expected value. 
*Now assume that the process is a homogeneous Markov chain. Let $q = (q_{1}, q_{2}, q_{3},q_{4})$ be the vector of parameters for the Exponential distributions of the holding times at the four different states, respectively. Assume independent priors for each qi proportional to $1/qi$. 
Now use the data from the figure to obtain a posterior distribution for q. 
Express the posterior using parametric distributions with explicit parameters. 
Compute the expected value of the posterior distribution.*

The parameters for the exponential distribution of the holding times are given by $q = (q_{1}, q_{2}, q_{3},q_{4})$. Let the observed holding times for a state be $x_{1}, \dots x_{n}$, the values are the following:

|     | $x_1$ | $x_{2}$ | $x_{3}$ | $x_{4}$ | $x_{5}$ | $x_{6}$ | $x_{7}$ |
| --- | ----- | ------- | ------- | ------- | ------- | ------- | ------- |
| 1   | 1     | 1       | 1       | ...     |         |         |         |
| 2   | 1     | 1.1     | 1.8     | ...     |         |         |         |
| 3   | 1.1   |         |         |         |         |         |         |
| 4   |       |         |         |         |         |         |         |

The likelyhood for each state indepentently is thus given by the exponential distribution: 
$$
\pi(x_{1}, \dots x_{n} | q_{i}) = \prod_{i=1}^n \mathrm{Exponential}(x_{j} ; q_{i}) = q_{i}^n \exp\left( -q_{i} \sum_{j=1}^n x_{j} \right)
$$
The priors are given by independent $\pi(q_{i}) = \frac{1}{q_{i}}$. 
For the posteriors we thus get indepentently: 
$$
\pi(q_{i} | x_{1}, \dots x_{n}) \propto \pi(x_{1}, \dots x_{n} | q_{i}) \pi(q_{i}) = q_{i}^{n-1} \exp\left( -q_{i} \sum_{j=1}^n x_{j} \right) \propto \mathrm{Gamma}(q_{i}, n, \sum_{j=1}^n x_{j} )
$$
$$
\begin{align}
q_1 &\sim \text{Gamma}(n, 1.0) \\
q_2 &\sim \text{Gamma}(n, 1.0) \\  
q_3 &\sim \text{Gamma}(n, 1.0) \\ 
q_4 &\sim \text{Gamma}(n, 1.0) \\
\end{align}
$$
The expectation of a Gamma Distribution is: $E[X] = \alpha \cdot \beta$, so we get the expected rates:

## c) Long term Probability 
*Write R code which takes as input the transition matrix $\tilde P$ of a continuous-  
time discrete state-space Markov chain and a vector $q$ of parameters for the  
distributions of the holding times of the chain, and outputs the long-term  
probability that the process will be in state 3.  
Apply the code to the expected values found in questions (a) and (b) and  
report the result.*

Chain is irreducible: We visited all states 
Goal: Find stationary distribution (which is limiting distribution)

Solve $\pi Q = 0$
## d) Simulation
*Use simulation in R and your results from questions (a), (b), and (c) to answer the following question: Taking into account the parameter uncertainty, what is the long-term probability that the process in the Figure is in state 3?* 

Sample different P and q, apply function from c, average. 
## e) 
*Implement simulation of a realization of the process over 30 steps. (You may if you like re-use and adapt code from Lecture 12). You should implement two versions of simulation*
- *Draw values for  $\tilde P$ and $q$ from their posteriors, and use these values when simulating all the steps of the process.* 
- *Simulate only one transition or one duration at the time, and update posteriors with simulated values before going to the next step.*

First sample j from $P_{i}$, then sample holding time with parameter $q_{j}$ 

Add a plot here. 
## f) 
*Find the formula for the probability that $k$ independent random variables with $\mathrm{Exponential}(λ)$ distributions are all at least $1$. Then, compute analytically the expectation of this formula when $\lambda$ has a $\mathrm{Gamma}(α, β)$ distribution.*

Let $X_{i} \sim \mathrm{Exponential}(\lambda)$ for $i \in \{ 1, \dots, k \}$.  
The probabilty that $X_{i} \geq 1$, is given by: 
$$
P(X_{i} \geq 1) = 1 - P(X_{i}  \leq 1) + P(X_{i} = 1) = 1 - (1 - e^{-\lambda}) + 0 = e^{-\lambda}
$$
So for all to be at least one, we get: 
$$
P(X_{1} \geq 1, \dots, X_{k} \geq 1) = P(X_{1} \geq 1) \cdots P(X_{k} \geq 1) = (e^{-\lambda})^k = e^{-k \lambda}
$$

$$
E[e^{-k \lambda}] = \int_{0}^\infty e^{-\lambda} \mathrm{Gamma}(\lambda; \alpha, \beta) \, d\lambda = \frac{\beta^\alpha}{\Gamma(\alpha)} \int_{0}^\infty e^{-\lambda} \lambda^{\alpha - 1} e^{-(\beta)\lambda} d\lambda
$$
## g) 
*Note that in the Figure, all visits to state 1 are at least 1 long. Use your result in (f) to compute the probability, under our assumptions so far, that this happens. If this were a real, applied setting, what kind of conclusions might be drawn from this computation?*

Probably take the average over all simulated q?
$$
P(X_{1} \geq 1, \dots, X_{7} \geq 1) = e^{-7 q_{1}}
$$