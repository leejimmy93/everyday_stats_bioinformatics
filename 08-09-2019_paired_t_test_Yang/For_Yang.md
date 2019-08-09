---
title: "For_Yang"
output: 
  html_document: 
    keep_md: yes
---

* The goal of this script is to do paired t-test between handrawn and emoj group and see whether
there is significant difference between the two groups 


```r
library(tidyverse)
```

```
## ── Attaching packages ───────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.1.1     ✔ purrr   0.3.2
## ✔ tibble  2.1.1     ✔ dplyr   0.8.1
## ✔ tidyr   0.8.3     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.4.0
```

```
## ── Conflicts ──────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

### load data & format 

```r
path <- "/Users/rli/Desktop/Yang"
files <- list.files(path=path, pattern = "*.txt")
setwd(path)
files <- files[c(1, 3:12)]

table <- lapply(files, function(x) read.table(x)) 
names(table) <- files 
length(table)
```

```
## [1] 11
```

```r
names(table) 
```

```
##  [1] "peer_emotions.txt"       "self_aesthetics.txt"    
##  [3] "self_angle.txt"          "self_disirable.txt"     
##  [5] "self_ease_of_learn.txt"  "self_effectiveness.txt" 
##  [7] "self_expressiveness.txt" "self_helpfulness.txt"   
##  [9] "self_intensity.txt"      "self_satisfaction.txt"  
## [11] "self_time.txt"
```

```r
colnames(table$peer_emotions.txt)[2] <- "emog"
```

### do test and output result 

```r
result <- 
lapply(names(table), function(i){
  t.test(table[[i]]$handdraw, table[[i]]$emog, alternative="two.sided",mu=0,paired=T) 
}) 

names(result) <- files
result  
```

```
## $peer_emotions.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -14.115, df = 19, p-value = 1.596e-11
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.3294483 -0.2443612
## sample estimates:
## mean of the differences 
##              -0.2869048 
## 
## 
## $self_aesthetics.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -2.6766, df = 20, p-value = 0.0145
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -2.033524 -0.252190
## sample estimates:
## mean of the differences 
##               -1.142857 
## 
## 
## $self_angle.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -1.6137, df = 20, p-value = 0.1223
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -1.6375888  0.2090173
## sample estimates:
## mean of the differences 
##              -0.7142857 
## 
## 
## $self_disirable.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -7.155, df = 20, p-value = 6.252e-07
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.013592 -1.653075
## sample estimates:
## mean of the differences 
##               -2.333333 
## 
## 
## $self_ease_of_learn.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -1.7715, df = 20, p-value = 0.09172
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -1.555384  0.126813
## sample estimates:
## mean of the differences 
##              -0.7142857 
## 
## 
## $self_effectiveness.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -6.0331, df = 20, p-value = 6.737e-06
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.076009 -1.495419
## sample estimates:
## mean of the differences 
##               -2.285714 
## 
## 
## $self_expressiveness.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -3.1788, df = 20, p-value = 0.004719
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -1.3407389 -0.2783087
## sample estimates:
## mean of the differences 
##              -0.8095238 
## 
## 
## $self_helpfulness.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -8.8022, df = 20, p-value = 2.583e-08
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.063004 -1.889377
## sample estimates:
## mean of the differences 
##                -2.47619 
## 
## 
## $self_intensity.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -2.0957, df = 20, p-value = 0.04904
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -2.090364241 -0.004873855
## sample estimates:
## mean of the differences 
##               -1.047619 
## 
## 
## $self_satisfaction.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = -5.2253, df = 20, p-value = 4.104e-05
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -2.665152 -1.144372
## sample estimates:
## mean of the differences 
##               -1.904762 
## 
## 
## $self_time.txt
## 
## 	Paired t-test
## 
## data:  table[[i]]$handdraw and table[[i]]$emog
## t = 2.3753, df = 20, p-value = 0.02765
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##   11771.43 181490.38
## sample estimates:
## mean of the differences 
##                 96630.9
```

