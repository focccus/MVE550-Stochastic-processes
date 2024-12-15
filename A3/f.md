### Probability that \( k \) independent \( \text{Exponential}(\lambda) \) random variables are all at least 1

\( P(X_i \geq 1) = 1 - P(X_i \lt 1) = 1 - F_{X_i}(1)\)

where \(F_{X_i}(1)\) is the CDF. The CDF for the \(Exponential(\lambda)\) is:

\(F_{X_i}(x) = 1 - e^{-\lambda x}\)

so \( P(X_i \geq 1) = 1 - (1-e^{-\lambda*1}) = e^{-\lambda}\)

Since our RVs are independent the join probability is the product of individual probabilities.

\( P(X_1 \geq 1, X_2 \geq 1, ... X_k \geq 1) = \prod_{i=1}^k P(X_i \geq 1) = e^{-k\lambda}\)

\mathbb{E}[e^{-k\lambda}] \quad \text{when } \lambda \sim \text{Gamma}(\alpha, \beta)


Since the \( k \) random variables are independent, the joint probability is:

\[
P(X_1 \geq 1, X_2 \geq 1, \dots, X_k \geq 1) = \prod_{i=1}^k P(X_i \geq 1) = (e^{-\lambda})^k = e^{-k\lambda}
\]

### Expectation \( E[e^{-k\lambda}]\) when \( \lambda \sim \text{Gamma}(\alpha, \beta) \)

For \( \lambda \sim \text{Gamma}(\alpha, \beta) \) PDF is:

\( f_\lambda(\lambda) = \frac{\beta^\alpha}{\Gamma(\alpha)} \lambda^{\alpha - 1} e^{-\beta \lambda}, \quad \lambda > 0\)

then we get

\( E[e^{-k\lambda}] = \int_{0}^{\infty} e^{-k\lambda} f_\lambda(\lambda) \, d\lambda = \frac{\beta^\alpha}{\Gamma(\alpha)} \int_{0}^{\infty} \lambda^{\alpha - 1} e^{-(k+\beta) \lambda} \, d\lambda
\)

By some motivation \(\lambda^{\alpha - 1} e^{-(k+\beta) \lambda} \, d\lambda\) is \(\frac{\Gamma(\alpha)}{(k+\beta)^\alpha}\)

Leading to 

\( E[e^{-k\lambda}] = \frac{\beta^\alpha}{\Gamma(\alpha)} * \frac{\Gamma(\alpha)}{(k+\beta)^\alpha} = (\frac{\beta}{k+\beta})^\alpha \)