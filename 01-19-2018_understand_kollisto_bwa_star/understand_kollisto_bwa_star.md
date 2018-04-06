---
title: "understand_kollisto_bwa_star"
author: "Ruijuan Li"
date: "1/19/2018"
output: 
  html_document: 
    keep_md: yes
---

I don't understand the difference among various aligners, so I decided to figure it out by myself. 

### Limma-voom VS VST 

before going to differnet aligners, I will firstly summarize my searching result on Limma-voom & VST

* Limma-voom, is another kind of method for RNA-seq expression analysis. While Limma was developed for microarray, voom transformation can transform RNA-seq data similar to microarray, ready for Limma protocol. 

* https://seqqc.wordpress.com/2015/02/16/should-you-transform-rna-seq-data-log-vst-voom/
* https://www.slideshare.net/mikaelhuss/rnaseq-differential-expression-analysis?next_slideshow=1

Here are two related materials which I found helpful to understand voom and vst, basically limma-voom & VST are very similar in performance. 

### different aligners

* kallisto: alignment indepedent tool, map reads to cds or cdna, uses k-mer approach. kallisto accurately quantify transcript-level abundance from RNA-seq data. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment. Pseudoalignment of reads preserves the key information needed for quantification, and kallisto is therefore not only fast, but also as accurate as existing quantification tools.  

A major force behind kallisto being super-fast is its pseudo-alignment process. kallisto’s pseudo-alignment approach finds potential transcript origins of RNA-seq reads really fast using k-mers in the read and the transcriptome De Bruijn graph built from the transcritome, instead of doing base level read alignment.    

![figure](https://github.com/leejimmy93/bioinfo_miscs/blob/master/01-19-2018/plot.png)  

Overview of kallisto. The input consists of a reference transcriptome and reads from an RNA-seq experiment. (a) An example of a read (in black) and three overlapping transcripts with exonic regions as shown. (b) An index is constructed by creating the transcriptome de Bruijn Graph (T-DBG) where nodes (v1, v2, v3, ... ) are k-mers, each transcript corresponds to a colored path as shown and the path cover of the transcriptome induces a k-compatibility class for each k-mer. (c) Conceptually, the k-mers of a read are hashed (black nodes) to  nd the k-compatibility class of a read. (d) Skipping (black dashed lines) uses the information stored in the T-DBG to skip k-mers that are redundant because they have the same k-compatibility class. (e) The k-compatibility class of the read is determined by taking the intersection
of the k-compatibility classes of its constituent k-mers.  

Also, here is a nice summary of Kallisto:   http://nextgenseek.com/2015/05/kallisto-paper-summary-near-optimal-rna-seq-quantification/

What is the good tool for expression analysis on the ouput of kallisto? 

sleuth is the tool which is suggested to be used downstream of kallisto. Here is the manual: https://scilifelab.github.io/courses/rnaseq/labs/kallisto 

* bwa

Both Bowtie and BWA used similar Burrows-Wheeler Transform methods, they are generally used to align genomic DNA sequence data, such as ChIP-seq data. 

* star 

For RNA-seq, STAR (Spliced Transcripts Alignment to a Reference) would be a better choice. When aligning RNA reads, the aligner (STAR, HISAT2, etc) will expect reads to split across exons, as such the appropriate penalty for that is tuned - that sort of event shouldn't happen with DNA. 




