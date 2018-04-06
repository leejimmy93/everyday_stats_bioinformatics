---
title: "biological_coeffecient_variance_edgeR"
author: "Ruijuan Li"
date: "2/5/2018"
output: 
  html_document: 
    keep_md: yes
---

* This is something that I found online about BCV in edgeR, still looks useful to me to understand the model in edgeR 

I am using the package EdgeR for calculating differential expression between genes. However, I'm a bit of rookie in statistics and have a few questions regarding some concepts. I'd greatly appreciate your help in getting my head around these concepts. My questions are as follows:

### 1) What does Common Dispersion really mean? 

Context: I have 2 replicates of my sample and a regular pairwise correlation suggests a coefficient of 0.98 between the replicates. However, when I run the estimateCommonDisp() function in EdgeR it gives me 0.035 as an estimate of common dispersion. The manual and some online posts seem to suggest that low estimate indicates high variability between replicates. Is that true or am I being mistaken? 

### 2) Is it always better to use moderated tagwise dispersion (as it seems more customized to each tag than a general one-size-fits-all). When is it better to use tagwise over only common dispersion? Also, when you do smoothing, what do you really do?

### 3) How does the prior.n value affect the results? 

Context: My prior.n value post smoothing is 0.0002284025. The manual asks prior.n=10 as default.It also says that lower the value, the more highly variable tags will be heavily penalized and there will be less "squeezing" of tagwise dispersions towards a common value. Is that good or bad? Should I use the value obtained with my dataset or some value between 10 and 40 as suggested?

First, thanks for using edgeR and I hope that I can clarify some of the concepts that you're having a little difficulty with. 

### 1) Common Dispersion

When assessing differential expression, it is really important to model the variability in the data appropriately. For the count data that we obtain from RNA-seq experiments, we use the negative binomial (NB) model, because there is typically more variation in RNA-seq data than can be accounted for by the Poisson model (called overdispersion). We estimate the mean (mu) of the counts for each gene, which corresponds to the abundance of that gene in the RNA sample. In edgeR we model the mean for a gene as the library size X concentration. This model has a second parameter, called the dispersion parameter (under our parameterization). This parameter is very important, as it determines how we model the variance for each gene. The variance function for each gene is V = mu X ( 1 + dispersion * mu ), where each gene has a distinct value for mu. 

Under the "common dispersion model" we use the same value for the dispersion when modelling the variance for each gene. Under a tagwise model we allow for a different value for the dispersion to be used for each gene. So in brief, the dispersion is vital for modelling the variance of each gene and the common dispersion means that we use the same value of the dispersion for each gene. (NB: this does not mean that the variance is the same for each gene! Remember that the variance is quadratic in the mean, so variance increases with gene mean).

Now to the interpretation. First, the common dispersion is completely different from correlation between two replicates, so it is not surprising that they are very different. I would not recommend using correlation as a way to assess the similarity of samples, especially when there is a nice interpretation of the common dispersion. The common dispersion is the "squared coefficient of variation", where the coefficient of variation gives the amount of variability in the true abundance for each gene between replicates (which we can't measure directly). In your example, you have a common dispersion estimate of 0.035, which (take square root) gives an estimate of the coefficient of variation of 0.19. We interpret this as saying that the true abundance for each gene can vary up or down by 19% between replicates.

I hope that it is clear from that explanation that the higher the estimate of the common dispersion the higher the variability between replicates, not what you suggested in your post. I am concerned that you were led to the mistaken understanding that a low estimate indicates high variability between replicates. Can you point me towards places in the manual or forums/online posts that suggest this? I would like to clear up misunderstandings where I can, and if I need to edit the manual to make it clearer, then that would be good to know.

### 2) Moderated tagwise dispersion

The motivation for using moderated tagwise dispersions is that you may not really believe that every gene has the same common value for the dispersion, so you want to allow and estimate a distinct, individual dispersion for each gene. The problem with this is that we usually have very small samples in RNA-seq experiments (e.g. perhaps 3 samples in each of two groups). This means that we might be estimating a dispersion for each gene on 4 or 5 degrees of freedom, which leads to very unreliable estimates. On the other hand, we are estimating the common dispersion from many thousands of observations, so we expect this to be very reliable. The idea, then, is to moderate or "squeeze" the tagwise dispersion estimates towards the common value. So estimates larger than the common value are made smaller and estimates smaller than the common value are made larger. This makes the tagwise dispersion estimates more stable and improves inference over using "raw" tagwise dispersion estimates.

It is not necessarily better to do tagwise over only common dispersion. Moderated tagwise dispersion will tend to rank more highly as DE genes that are more consistent in their counts within groups, whereas using common dispersion is more likely to rank genes with one extremely large count in one library as highly DE. So in that sense, which one you use will depend on your preference for what you consider to be more interesting DE genes. Why not try both approaches and compare the results?

### 3) prior.n

The value for prior.n determines the amount of smoothing of tagwise dispersions towards the common dispersion. You can think of it as like a "weight" for the common value. (It is actually the weight for the common likelihood in the weighted likelihood equation). The larger the value for prior.n, the more smoothing, i.e. the closer your tagwise dispersion estimates will be to the common dispersion. If you use a prior.n of 1, then that gives the common likelihood the weight of one observation. 

In answer to your question, it is a good thing to squeeze the tagwise dispersions towards a common value, or else you will be using very unreliable estimates of the dispersion. I would not recommend using the value that you obtained from estimateSmoothing()---this is far too small and would result in virtually no moderation (squeezing) of the tagwise dispersions. How many samples do you have in your experiment? What is the experimental design? If you have few samples (<6) then I would suggest a prior.n of at least 10. If you have more samples, then the tagwise dispersion estimates will be more reliable, so you could consider using a smaller prior.n, although I would hesitate to use a prior.n less than 5. 



