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

_An animal exposed to the pollutant concentration $x$ and the temperature $y$ has a probability $p = f (x, y, theta_1, theta_2, theta_3)$ of developing the disease, where_

$
pi(z = 1 | x,y,theta_1, theta_2, theta_3) = f(x, y, theta_1, theta_2, theta_3) = frac(exp(e^(theta_1) x + e^(theta_2)(y - theta_3)^2) - 1, exp(e^(theta_1) x + e^(theta_2)(y - theta_3)^2) + 1) .
$

- $theta = (theta_1,theta_2,theta_3) in RR^3$
- Uniform prior: $pi(theta_i) prop 1$

== Visualize the Data

#figure(
  image("fig/scatter_data.png", width: 40%),
  caption: [
    Scatter plot of the data
  ],
)<fig:scatter_data>

== What is the likelihood and posterior? <b-what-is-the-likelihood-and-posterior>
_Using the model above and the function f , write down the likelihood of the data (i.e., a formula for the probability of the data given the parameters of the model). Also, write down a function that is proportional to the posterior density for the parameters._

We can assume that each data point is i.i.d. with 

$ 
pi(z_i = 1 | x_i,y_i,theta_1, theta_2, theta_3) &= f(x_i, y_i, theta_1, theta_2, theta_3) \
pi(z_i = 0 | x_i,y_i,theta_1, theta_2, theta_3) &= 1 - f(x_i, y_i, theta_1, theta_2, theta_3)
$

So for the total likelihood we get the product of each probability

$
pi \(D  divides  theta _(1 )\, theta _(2 )\, theta _(3 )\) =  product _(i = 1 )^(N ) lr(\[  f \(x _(i )\, y _(i )\, theta _(1 )\, theta _(2 )\, theta _(3 )\)^(z _(i )) dot.c  lr(\( 1  -  f \(x _(i )\, y _(i )\, theta _(1 )\, theta _(2 )\, theta _(3 )\)\) )^(1  -  z _(i )) \] ). 
$

For the posterior we can use Bayes theorem and make use of the fact that $theta_1, theta_2, theta_3$ are independent and uniformly distributed:
$
pi \(theta _(1 )\, theta _(2 )\, theta _(3 ) divides  D \) prop  pi \(D  divides  theta _(1 )\, theta _(2 )\, theta _(3 )\) pi \(theta _(1 )\, theta _(2 )\, theta _(3 )\) \
= pi \(D  divides  theta _(1 )\, theta _(2 )\, theta _(3 )\) pi(theta_1) pi(theta_2) pi(theta_3)
prop pi \(D  divides  theta _(1 )\, theta _(2 )\, theta _(3 )\)
$

== <c>
_Write an R function that takes as input values for two parameters $theta = lr((theta_1 , theta_2 , theta_3))$ and $theta^(\*) = lr((theta_1^(\*) , theta_2^(\*) , theta_3^(\*)))$ and computes a function that is equal to_ 
$ log lr((frac(
  pi lr((theta^(\*) divides upright(d a t a))),
  pi lr((theta divides upright(d a t a))),

))) $ 

Because of the quotient the proportionality constant does not matter and we see that this is in fact equal to the the proportion of the likelihood, this can then be simplified with logarithm rules:

$
log  lr((frac(
  pi lr((theta^(\*) divides upright(d a t a))),
  pi lr((theta divides upright(d a t a))),
))) 
&= log lr((frac(
  pi(D | theta^*),
  pi(D | theta),

))) = log(pi(D | theta^*)) - log(pi(D | theta))\ 
&= sum_(i=1)^N log(pi(z_i = 1 | x_i,y_i,theta^*)) - log(pi(z_i = 1 | x_i,y_i,theta))
$



== <d>
_Implement an MCMC algorithm that generates a Markov chain of length 10000 with limiting distribution equal to the posterior for $theta$. \
Use a proposal distribution which adds to each parameter a normally distributed variable with expectation zero and standard deviation $0.4$. Find a starting value for the chain by studying what values for $theta$ might be reasonable for the given data. \
Produce trace plots (plots mapping simulated values for $theta_i$ against its index i) for the parameters $theta_1 , theta_2$, and $theta_3$._


#grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        figure(
          image("fig/trace12.png",   width: 100%),
          caption: [
            Trace plot of $theta_1, theta_2$ with mean
          ],
        ),
        figure(
          image("fig/trace3.png", width: 100%), 
           caption: [
            Trace plot of $theta_3$ with mean
           ],
        ),
)

== <e>
Compute numerically the predicted probability that an animal at pollutant concentration $x = 0.7$ and temperature $y = 19$ will have the disease.

Also, compute the predicted probability that among 10 animals exposed to this temperature and this pollutant concentration, 9 will have the disease.

#pagebreak()

= Branching Process <exercise-2-branching-process>
Consider a branching process where the offspring distribution is a Poisson distribution with parameter $lambda = 1.4$.

== <a>
_Use R to compute the probability that such a process will go extinct._

Find: 
$
s = G(s) 
= E[s^X] 
= sum_(k=0)^infinity s^k P(X = k) 
= sum_(k=0)^infinity frac((s lambda)^k,k!) e^(-lambda)
= e^(-lambda) sum_(k=0)^infinity frac((s lambda)^k,k!) 
= e^(-lambda) e^(s lambda) = e^(lambda(s - 1))
$

Note:
$ exp(x) = sum_(n = 0 )^(oo) frac(x^n,n! ) $


== <b>

#figure(
  image("fig/branching_process.png", width: 50%),
  caption: [
    Branching Process
  ],
)<fig:branching_process>

_Consider the process whose first 5 steps are pictured in @fig:branching_process. Assume its offspring distribution is $"Poisson"(1.4)$. What is the probability that the continuation of this process will go extinct?_


// notes:
$ Z_5 = 11 $

Assume process starts 11 times?

$ P(E | Z_5 = 11) = 11 e ? $ 


== <c-1>
_Now, consider instead a branching process with a $"Poisson"(lambda)$ offspring distribution where $lambda$ is unknown. We assume a prior $pi(lambda) prop_lambda 1 / lambda$. Assume now that @fig:branching_process depicts a realization of this process. \
What is the resulting likelihood for $lambda$? What is the posterior distribution for $lambda$?_

// notes 
$ Z_n = sum_(i = 1)^(Z_n - 1) X_i =  sum_(i = 1)^(Z_n - 1) frac(lambda^k, k!) e^-lambda $

== <d-1>
_We want to compute the probability of extinction of a branching process of the type of question (c), taking into account the uncertainty in $lambda$. The extinction probability can then be written as an integral of a product of two functions of $lambda$. Write down this integral and compute its value with R using numerical integration._

For all possible values of $lambda$ take the weighted sum of all extinction probabilities:

$ P(E) = integral_lambda pi(lambda) P(E | lambda) d lambda $


== <e-1>
_Consider the process in in @fig:branching_process, depicting a realization of a branching process with a $"Poisson"(lambda)$ offspring distribution with unknown $lambda$, as in question (c). Compute the probability that the continuation of this process will go extinct._
