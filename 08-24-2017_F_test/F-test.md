# F-test
Ruijuan Li  
8/24/2017  

### F-Test: Compare Two vairnace in R

F-test is used to assess whether the variances of two populations (A and B) are equal.

* When to use F-test 
Comparing two variances is useful in several cases, including:

1) When you want to perform a two samples t-test to check the equality of the variances of the two samples

2) When you want to compare the variability of a new measurement method to an old one. Does the new method reduce the variability of the measure?

* Research question and statistical hypotheses
Typical research questions are:

whether the variance of group A (σ2AσA2) is equal to the variance of group B (σ2BσB2)?
whether the variance of group A (σ2AσA2) is less than the variance of group B (σ2BσB2)?
whether the variance of group A (σ2AσA2) is greather than the variance of group B (σ2BσB2)?
In statistics, we can define the corresponding null hypothesis (H0H0) as follow:

H0:σ2A=σ2BH0:σA2=σB2
H0:σ2A≤σ2BH0:σA2≤σB2
H0:σ2A≥σ2BH0:σA2≥σB2
The corresponding alternative hypotheses (HaHa) are as follow:

Ha:σ2A≠σ2BHa:σA2≠σB2 (different)
Ha:σ2A>σ2BHa:σA2>σB2 (greater)
Ha:σ2A<σ2BHa:σA2<σB2 (less)
Note that:

Hypotheses 1) are called two-tailed tests
Hypotheses 2) and 3) are called one-tailed tests

* Formula of F-test 
The test statistic can be obtained by computing the ratio of the two variances S2ASA2 and S2BSB2.

F=S2AS2B
F=SA2SB2

The degrees of freedom are nA–1nA–1 (for the numerator) and nB–1nB–1 (for the denominator).

Note that, the more this ratio deviates from 1, the stronger the evidence for unequal population variances.

Note that, the F-test requires the two samples to be normally distributed.

* Compute F-test in R 
R function
The R function var.test() can be used to compare two variances as follow:

Method 1
var.test(values ~ groups, data, 
         alternative = "two.sided")

or Method 2
var.test(x, y, alternative = "two.sided")
x,y: numeric vectors
alternative: the alternative hypothesis. Allowed value is one of “two.sided” (default), “greater” or “less”.

* Example 

```r
library("dplyr")
```

```
## Warning: package 'dplyr' was built under R version 3.2.5
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
data("ToothGrowth")
my_data <- ToothGrowth
sample_n(my_data, 10)
```

```
##     len supp dose
## 41 19.7   OJ  1.0
## 19 18.8   VC  1.0
## 9   5.2   VC  0.5
## 28 21.5   VC  2.0
## 47 25.8   OJ  1.0
## 26 32.5   VC  2.0
## 50 27.3   OJ  1.0
## 25 26.4   VC  2.0
## 49 14.5   OJ  1.0
## 10  7.0   VC  0.5
```

We want to test the equality of variances between the two groups OJ and VC in the column “supp”.

Preleminary test to check F-test assumptions
F-test is very sensitive to departure from the normal assumption. You need to check whether the data is normally distributed before using the F-test.

Shapiro-Wilk test can be used to test whether the normal assumption holds. It’s also possible to use Q-Q plot (quantile-quantile plot) to graphically evaluate the normality of a variable. Q-Q plot draws the correlation between a given sample and the normal distribution.

If there is doubt about normality, the better choice is to use Levene’s test or Fligner-Killeen test, which are less sensitive to departure from normal assumption.

Compute F-test 

```r
res.ftest <- var.test(len ~ supp, data = my_data)
res.ftest
```

```
## 
## 	F test to compare two variances
## 
## data:  len by supp
## F = 0.6386, num df = 29, denom df = 29, p-value = 0.2331
## alternative hypothesis: true ratio of variances is not equal to 1
## 95 percent confidence interval:
##  0.3039488 1.3416857
## sample estimates:
## ratio of variances 
##          0.6385951
```

Interpretation of the result
The p-value of F-test is p = 0.2331433 which is greater than the significance level 0.05. In conclusion, there is no significant difference between the two variances.

https://www.r-bloggers.com/f-test-compare-two-variances-in-r/ 

