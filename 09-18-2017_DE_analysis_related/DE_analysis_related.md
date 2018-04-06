# normalization for differential expression analysis
Ruijuan Li  
9/18/2017  

### normalization 

#### regular edgeR steps are: 

1) read the data 

2) filter low expression tags

3) normalization

4) estimating the dispersion

5) differential expression 

Data normalization is used in the analysis of differential gene expression using statistical models to account for differences in sequencing depth between samples, differences in the distribution of counts between different samples, and (sometimes) differences in the lengths of genes across the genome. 

#### which data should be used for expression analysis? TPM? FPKM? RPKM? should length be considered or not? Which is the one edgeR uses? 

RPKM: Reads Per Kilobase Million
FPKM: Fragments Per Kilobase Million
TPM: Transcript Per Million

All these methods normalize for read depth and read length, RPKM 1stly normalize for read depth (M), then normalize for read length (K). FPKM is very similar to RPKM, but it is used in paired-end seq whereas RPKM is used in single-end seq. TPM also do the two steps, but switches the order, it is said to be more apporpriate for expression analysis, check the video below to see more explanation. 

http://www.rna-seqblog.com/rpkm-fpkm-and-tpm-clearly-explained/

However, for edgeR, CPM is used, which stands for counts per million, here the read length is not taken into consideration. 

"Like GC-content, gene length does not change from sample to sample, so it can be expected to have little effect on differential expression analysis" -- from edgeR. 

Julin also has some explanation in his BISI180L about why not normalize by gene length. 

http://jnmaloof.github.io/BIS180L_web/2017/05/18/RNAseq-edgeR/

"1) the number of reads is not always a linear function of gene length. 2) dividing by gene length causes a loss of information. By RPKM a gene of 1kb with 10 counts would be treated the same as a 100bp gene with 1 count, but clearly we are much more confident of the expression level when we have 10 counts instead of 1. This information is lost in RPKM." 

#### TMM
while edgeR is using cpm, the library size it takes into account is not the original lib size. it actually calculates an effective lib size. 

This is because: 
"Regarding normalization between samples, genes with very high expression levels can skew RPKM type normalization. Consider two samples where gene expression is the same except that in the first sample RUBISCO is expressed at a very high level, taking up half of the reads. In the second sample RUBISCO is expressed at a lower level, accounting for 25% of the reads. By CPM all non RUBISCO genes will appear to be expressed more highly in the second sample because RUBISO “takes up” fewer reads. Methods such as TMM normalization can account for this." -- from BISI180L

"The calcNormFactors function normalizes for RNA composition by finding a set of scaling factors for the library sizes that minimize the log-fold changes between the samples for most genes. The default method for computing these scale factors uses a trimmed mean of M-values (TMM) between each pair of samples. We call the product of the original library size and the scaling factor the e↵ective library size. The effective library size replaces the original library size in all downsteam analyses." -- From edgeR manual 

* As a summary, edgeR is using CPM to report read count, but the per million per library here is using an effective lib size, which is calculated using TMM method to account for lib size effect. 

paper on TMM 

https://genomebiology.biomedcentral.com/articles/10.1186/gb-2010-11-3-r25

#### VOOM 
There are different packages and method for differential expression analysis, how to decide which one to use? Below is a disscussion. 

https://mikelove.wordpress.com/2016/09/28/deseq2-or-edger/ 

next time I still need to explore limma voom VS deseq2 VS edgeR 
also dispersion in edgeR 


