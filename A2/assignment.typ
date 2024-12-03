#import "@preview/problemst:0.1.0": pset
#import "@preview/quick-maths:0.2.0": shorthands

#show: pset.with(
  class: "MVE550",
  student: "Mahdi Afarideh, Jan Marten Winkler, Fredrik Nyström",
  title: "Assignment 2",
  date: datetime(year: 2024, month: 12, day: 06),
  collaborators: ()
)

#show: shorthands.with(
  ($+-$, $plus.minus$),
)

#set heading(numbering: "1.a.", depth: 2)

#let deriv(num, dnm)=[$ (partial num) / (partial dnm) $]

= MCMC

$
f(x, y, theta_1, theta_2, theta_3) = frac(exp(e^(theta_1) x + e^(theta_2)(y - theta_3)^2) - 1, exp(e^(theta_1) x + e^(theta_2)(y - theta_3)^2) + 1) .
$

- $theta = (theta_1,theta_2,theta_3)$
- Uniform prior: $pi(theta_i) prop 1$

== What is the likelihood and posterior? <b-what-is-the-likelihood-and-posterior>
Using the model above and the function f , write down the likelihood of the data (i.e., a formula for the probability of the data given the parameters of the model). Also, write down a function that is proportional to the posterior density for the parameters.

== <c>
Write an R function that takes as input values for two parameters $theta = lr((theta_1 , theta_2 , theta_3))$ and $theta^(\*) = lr((theta_1^(\*) , theta_2^(\*) , theta_3^(\*)))$ and computes a function that is equal to $ log lr((frac(
  pi lr((theta^(\*) divides upright(d a t a))),
  pi lr((theta divides upright(d a t a))),

))) $ i.e., the logarithm of the quotient of the posterior densities for $theta^*$ and $theta$

== <d>
Implement an MCMC algorithm that generates a Markov chain of length 10000 with limiting distribution equal to the posterior for $theta$.

Use a proposal distribution which adds to each parameter a normally distributed variable with expectation zero and standard deviation $0.4$. Find a starting value for the chain by studying what values for $theta$ might be reasonable for the given data.

Produce trace plots (plots mapping simulated values for $theta_i$ against its index i) for the parameters $theta_1 , theta_2$, and $theta_3$.

== <e>
Compute numerically the predicted probability that an animal at pollutant concentration $x = 0.7$ and temperature $y = 19$ will have the disease.

Also, compute the predicted probability that among 10 animals exposed to this temperature and this pollutant concentration, 9 will have the disease.

#pagebreak()

= Branching Process <exercise-2-branching-process>
Consider a branching process where the offspring distribution is a Poisson distribution with parameter $lambda = 1.4$.

== <a>
Use R to compute the probability that such a process will go extinct.

Find: 
$
s = G(s) = E[s^X]
$

== <b>

#figure(
  image("branching_process.png", width: 50%),
  caption: [
    Branching Process
  ],
)<fig:branching_process>

Consider the process whose first 5 steps are pictured in @fig:branching_process. Assume its offspring distribution is $"Poisson"(1.4)$. What is the probability that the continuation of this process will go extinct?


// notes:
$ Z_5 = 11 $

Assume process starts 11 times?

$ P(E | Z_5 = 11) = 11 e ? $ 


== <c-1>
Now, consider instead a branching process with a $"Poisson"(lambda)$ offspring distribution where $lambda$ is unknown. We assume a prior $pi(lambda) prop_lambda 1 / lambda$. Assume now that @fig:branching_process depicts a realization of this process.

What is the resulting likelihood for $lambda$? What is the posterior distribution for $lambda$?

// notes 
$ Z_n = sum_(i = 1)^(Z_n - 1) X_i =  sum_(i = 1)^(Z_n - 1) frac(lambda^k, k!) e^-lambda $

== <d-1>
We want to compute the probability of extinction of a branching process of the type of question (c), taking into account the uncertainty in $lambda$. The extinction probability can then be written as an integral of a product of two functions of $lambda$. Write down this integral and compute its value with R using numerical integration.

$ P(E) = integral_lambda pi(lambda) P(E | lambda) d lambda $


== <e-1>
Consider the process in in @fig:branching_process, depicting a realization of a branching process with a $"Poisson"(lambda)$ offspring distribution with unknown $lambda$, as in question (c). Compute the probability that the continuation of this process will go extinct.

= Demo

#let add(x, y) = $sum_#x^#y$

$ add(i=5, n) + 5 $

#let a = 5 

Text with #a.

#for c in "ABC" [
  #c is a letter.
]

#let n = 2
#while n < 10 {
  n = (n * 2) - 1
  (n,)
}