---
title: "04_12_2018_vst_voom_log2"
author: "Ruijuan Li"
date: "4/12/2018"
output: 
  html_document: 
    keep_md: yes
---

SHOULD YOU TRANSFORM RNA-SEQ DATA: LOG, VST, VOOM? 
I see Julin uses voom a lot, while I was introduced to vst 1stly, so use vst more often. also why report log2 fold change for expression analysis?

https://seqqc.wordpress.com/2015/02/16/should-you-transform-rna-seq-data-log-vst-voom/ 

In summary, vst and voom are popular transformation techniques, and the decision depends on your application. Log is simple and easy to interpret, but it does not let you take the log of zero and it may not correct for heteroscedasticity completely. VST may be the prefered solution for your application, because it takes care of over dispersion problem. 

The voom transformation is applied to the read counts. This converts the counts to log-counts per million with associated precision weights. After this, the RNA-seq data can be analyzed as if it was microarray data. This means for example that any of the linear modelling or gene set testing methods in the limma package can be applied to RNA-seq data.

VST transformation fitted dispersion-mean relation(s) and then transforms the count data (normalized by division by the size factors or normalization factors), yielding a matrix of values which are now approximately homoskedastic (having constant variance along the range of mean values). The transformation also normalizes with respect to library size. The rlog is less sensitive to size factors, which can be an issue when size factors vary widely. These transformations are useful when checking for outliers or as input for machine learning techniques such as clustering or linear discriminant analysis.

