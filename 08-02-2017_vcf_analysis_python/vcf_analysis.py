# pip install PyVCF
import vcf

# read in data and inspect the information 
v = vcf.Reader(filename='/Users/ruijuanli/Desktop/Brassica_project/RNA_seq/practice/SNP/IMB211_R500.vcf')

print('Variant Level information')

for info in infos:
       print(info)

print('Sample Level information')
fmts = v.formats

# inspect a single vcf record 
rec = next(v) # what next() is doing? 

print(rec.CHROM, rec.POS, rec.ID, rec.REF, rec.ALT, 
 rec.QUAL, rec.FILTER)

print(rec.INFO)
print(rec.FORMAT)
samples = rec.samples
print(len(samples))
sample = samples[1]
print(sample.called, sample.gt_alleles, sample.is_het,sample.phased)
print(int(sample['DP']))

# check the type of variant and the number of nonbiallelic SNPs 
from collections import defaultdict # what is this? 
f = vcf.Reader(filename='/Users/ruijuanli/Desktop/Brassica_project/RNA_seq/practice/SNP/IMB211_R500.vcf')

my_type = defaultdict(int)
num_alts = defaultdict(int)
 
for rec in f:
   my_type[rec.var_type, rec.var_subtype] += 1
   if rec.is_snp:
       num_alts[len(rec.ALT)] += 1

print(num_alts)
print(my_type)

