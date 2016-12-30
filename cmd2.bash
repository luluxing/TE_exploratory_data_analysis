#####################################################################
##	Calculte the percent of protein-coding genes that have TEs within
##	the 500/1000/2000 bp of start codons.
#####################################################################
#####################################################################
##	Arabidopsis thaliana (TAIR10)
#####################################################################
cd rawdata/arabidopsis_TAIR10

# The number of total protein-coding genes
less TAIR10_GFF3_genes_transposons.gff | grep protein_coding_gene |grep -v ChrM | grep -v ChrC | sort -k1,1 -k4,4g > tmp1.gff
less tmp1.gff | wc -l # 27206

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g TAIR10.chrom.sizes -s -l 500 -r 0 > tmp500.gff
bedtools flank -i tmp1.gff -g TAIR10.chrom.sizes -s -l 1000 -r 0 > tmp1000.gff
bedtools flank -i tmp1.gff -g TAIR10.chrom.sizes -s -l 2000 -r 0 > tmp2000.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b TAIR10_TE.gff | wc -l  # 4916
bedtools intersect -u -wa -a tmp1000.gff -b TAIR10_TE.gff | wc -l  # 6568
bedtools intersect -u -wa -a tmp2000.gff -b TAIR10_TE.gff | wc -l  # 8563

# 4916/27206=18.1%
# 6568/27206=24.1%
# 8563/27206=31.5%


#####################################################################
##	Zea mays (B73)
#####################################################################
cd rawdata/maize

# The number of total protein-coding genes
less ZmB73_5b_FGS.gff | grep protein_coding |grep gene | grep -v Mt | grep -v Pt | grep -v UNKNOWN | sort -k1,1 -k4,4g > tmp1.gff
less tmp1.gff | wc -l # 39024

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g Zm.chrom.sizes -s -l 500 -r 0 > tmp500.gff
bedtools flank -i tmp1.gff -g Zm.chrom.sizes -s -l 1000 -r 0 > tmp1000.gff
bedtools flank -i tmp1.gff -g Zm.chrom.sizes -s -l 2000 -r 0 > tmp2000.gff

# Filter the transposons of the chromosomes
tail +5 ZmB73_5a_MTEC_repeats.gff | grep -v UNKNOWN | grep -v chloroplast|grep -v mitochondrion|sort -k1,1g -k4,4g > tmp2.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b tmp2.gff | wc -l  # 17729
bedtools intersect -u -wa -a tmp1000.gff -b tmp2.gff | wc -l  # 26107
bedtools intersect -u -wa -a tmp2000.gff -b tmp2.gff | wc -l  # 32698

# 17729/39024=45.4%
# 26107/39024=66.9%
# 32698/39024=83.8%

#####################################################################
##	Oryza sativa (9311)
#####################################################################
cd rawdata/9311_rice

# The number of total protein-coding genes
less 9311_glean_gene.gff | grep gene|grep -v Scaffold|grep -v Supscaffold | sort -k1,1 -k4,4g > tmp1.gff
less tmp1.gff | wc -l # 37878

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g 9311.chrom.sizes -s -l 500 -r 0 > tmp500.gff
bedtools flank -i tmp1.gff -g 9311.chrom.sizes -s -l 1000 -r 0 > tmp1000.gff
bedtools flank -i tmp1.gff -g 9311.chrom.sizes -s -l 2000 -r 0 > tmp2000.gff

# Filter the transposons of the chromosomes
tail +2 9311_repeat_Repbase.gff|grep Chr| sort -k1,1 -k4,4g > tmp2.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b tmp2.gff | wc -l  # 14299
bedtools intersect -u -wa -a tmp1000.gff -b tmp2.gff | wc -l  # 22722
bedtools intersect -u -wa -a tmp2000.gff -b tmp2.gff | wc -l  # 29738

# 14299/37878=37.8%
# 22722/37878=60.0%
# 29738/37878=78.5%

#####################################################################
##	Solanum lycopersicum (ITAG2.4)
#####################################################################
cd rawdata/tomato_ITAG2.4

# The number of total protein-coding genes
less Sl_ITAG2.4_gene_models_sort_gff.txt|grep -v chr00 > tmp1.gff
less tmp1.gff | wc -l # 33838

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g Sl.chrom.sizes.txt -s -l 500 -r 0 > tmp500.gff
bedtools flank -i tmp1.gff -g Sl.chrom.sizes.txt -s -l 1000 -r 0 > tmp1000.gff
bedtools flank -i tmp1.gff -g Sl.chrom.sizes.txt -s -l 2000 -r 0 > tmp2000.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b Sl_ITAG2.4_repeats_chr.gff3 | wc -l  # 13220
bedtools intersect -u -wa -a tmp1000.gff -b Sl_ITAG2.4_repeats_chr.gff3 | wc -l  # 19747
bedtools intersect -u -wa -a tmp2000.gff -b Sl_ITAG2.4_repeats_chr.gff3 | wc -l  # 26151

# 13220/33838=39.1%
# 19747/33838=58.4%
# 26151/33838=77.3%

