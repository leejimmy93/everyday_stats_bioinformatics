---
title: "over_dispersion"
author: "Ruijuan Li"
date: "4/9/2018"
output: 
  html_document: 
    keep_md: yes
---

### what is over dispersion

Overdispersion is an important concept in the analysis of discrete data.
When the observed variance is higher than the variance of a theoretical model, overdispersion has occurred. 

### how to deal with over dispersion 

* use a CONTINUOUS MIXTURE model in which a linear model is attached not to the observations themselves but rather to a distribution of observations. 

such as using beta-binomial or gamma-poisson (negative-binomial) models for modeling. the model estimate the distribution of probabilities of success across cases, instead of a single probability of success. theta estimate in beta-binomial and gamma-poission (negative-binomial) captures the probability distribution, more dispersed or more condense.   

* employ multilevel models and estimate both the residuals of each observation and the distribution of those residuals. 

similar to the concept of random effect in maximum likelihood test.  

### overdispersion in biological data 

* some good discussions on over-dispersion 

https://www.otexts.org/node/674 

also chapter 11 monsters and mixtures has one section talking about over-dispersion. 

in Bioinformatics analysis, such as DE, we use negative-binomial model to fit the count data to account for the over-dispersion problem. edgeR uses common-dispersion, trend-dispersion and tag-wise dispersion to deal with over-dispersion problem, etc. 







