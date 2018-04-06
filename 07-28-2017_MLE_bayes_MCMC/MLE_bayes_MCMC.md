# MLE_Bayes_MCMC
Ruijuan Li  
7/28/2017  

### maximum likelihood estimation (MLE)

In statistics, maximum likelihood estimation (MLE) is a method of estimating the parameters of a statistical model given observations, by finding the parameter values that maximize the likelihood of making the observations given the parameters. MLE can be seen as a special case of the maximum a posteriori estimation (MAP) that assumes a uniform prior distribution of the parameters, or as a variant of the MAP that ignores the prior and which therefore is unregularized.

It basically sets out to answer the question: what model parameters are most likely to characterise a given set of data? First you need to select a model for the data. And the model must have one or more (unknown) parameters. As the name implies, MLE proceeds to maximise a likelihood function, which in turn maximises the agreement between the model and the data.

* Example 
#### Fitting a normal distribution 

```r
set.seed(1001)
N <- 100
x <- rnorm(N, mean = 3, sd = 2)
mean(x)
```

```
## [1] 2.998305
```

```r
sd(x) 
```

```
## [1] 2.288979
```

Then we formulate the log-likelihood function 

```r
LL <- function(mu, sigma) {
    R = dnorm(x, mu, sigma) # normal distribution 
    -sum(log(R)) # what is this? 
}
```

And apply MLE to estimate the two parameters (mean and standard deviation) for which the normal distribution best describes the data.

```r
library(stats4)
mle(LL, start = list(mu = 1, sigma=1))
```

```
## Warning in dnorm(x, mu, sigma): NaNs produced

## Warning in dnorm(x, mu, sigma): NaNs produced

## Warning in dnorm(x, mu, sigma): NaNs produced
```

```
## 
## Call:
## mle(minuslogl = LL, start = list(mu = 1, sigma = 1))
## 
## Coefficients:
##       mu    sigma 
## 2.998305 2.277506
```

The maximum-likelihood values for the mean and standard deviation are damn close to the corresponding sample statistics for the data. Of course, they do not agree perfectly with the values used when we generated the data: the results can only be as good as the data. If there were more samples then the results would be closer to these ideal values.

A note of caution: if your initial guess for the parameters is too far off then things can go seriously wrong! 

```r
mle(LL, start = list(mu = 0, sigma=1))
```

```
## 
## Call:
## mle(minuslogl = LL, start = list(mu = 0, sigma = 1))
## 
## Coefficients:
##       mu    sigma 
##  51.4840 226.8299
```

```r
?mle
```

#### MLE VS. bayes 
Now let’s try something a little more sophisticated: fitting a linear model. As before, we generate some data.

From STAN reference manual: "If the prior is uniform, the posterior mode corresponds to the maximum likelihood estimate (MLE) of the parameters. If the prior is not uniform, the posterior mode is sometimes called the maximum a posterior (MAP) estimate." 

### MCMC 
MCMC, produce samples from the joint posterior of a model w/o maximizing anything. The cost is that it may take much longer for our estimation to complete, and usually more work, the benefit is escaping the awkwardness of assumping mutivariate normality. 

use STAN: a probablility programming language implementing statistical inference. 

#### ridge regression (for GS)
Ridge regression uses L2 regularisation to weight/penalise residuals when the parameters of a regression model are being learned. In the context of linear regression, it can be compared to Ordinary Least Square (OLS). OLS defines the function by which parameter estimates (intercepts and slopes) are calculated. It involves minimising the sum of squared residuals. L2 regularisation is a small addition to the OLS function that weights residuals in a particular way to make the parameters more stable. The outcome is typically a model that fits the training data less well than OLS but generalises better because it is less sensitive to extreme variance in the data such as outliers.












