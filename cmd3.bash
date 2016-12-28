"""
	Calculte the percent of protein-coding genes that have TEs within
	the 500/1000/2000 bp of stop codons.
"""
"""
	Arabidopsis thaliana (TAIR10)
"""
cd rawdata/arabidopsis_TAIR10

# The number of total protein-coding genes
less TAIR10_GFF3_genes_transposons.gff | grep protein_coding_gene |grep -v ChrM | grep -v ChrC | sort -k1,1 -k4,4g > tmp1.gff
less tmp1.gff | wc -l # 27206

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g TAIR10.chrom.sizes -s -l 0 -r 500 > tmp500.gff
bedtools flank -i tmp1.gff -g TAIR10.chrom.sizes -s -l 0 -r 1000 > tmp1000.gff
bedtools flank -i tmp1.gff -g TAIR10.chrom.sizes -s -l 0 -r 2000 > tmp2000.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b TAIR10_TE.gff | wc -l  # 3436
bedtools intersect -u -wa -a tmp1000.gff -b TAIR10_TE.gff | wc -l  # 4826
bedtools intersect -u -wa -a tmp2000.gff -b TAIR10_TE.gff | wc -l  # 6843

# 3436/27206=12.6%
# 4826/27206=17.7%
# 6843/27206=25.2%


"""
	Zea mays (B73)
"""
cd rawdata/maize

# The number of total protein-coding genes
less ZmB73_5b_FGS.gff | grep protein_coding |grep gene | grep -v Mt | grep -v Pt | grep -v UNKNOWN | sort -k1,1 -k4,4g > tmp1.gff
less tmp1.gff | wc -l # 39024

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g Zm.chrom.sizes -s -l 0 -r 500 > tmp500.gff
bedtools flank -i tmp1.gff -g Zm.chrom.sizes -s -l 0 -r 1000 > tmp1000.gff
bedtools flank -i tmp1.gff -g Zm.chrom.sizes -s -l 0 -r 2000 > tmp2000.gff

# Filter the transposons of the chromosomes
tail +5 ZmB73_5a_MTEC_repeats.gff | grep -v UNKNOWN | grep -v chloroplast|grep -v mitochondrion|sort -k1,1g -k4,4g > tmp2.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b tmp2.gff | wc -l  # 18834
bedtools intersect -u -wa -a tmp1000.gff -b tmp2.gff | wc -l  # 26016
bedtools intersect -u -wa -a tmp2000.gff -b tmp2.gff | wc -l  # 32102

# 18834/39024=48.3%
# 26016/39024=66.7%
# 32102/39024=82.3%

"""
	Oryza sativa (9311)
"""
cd rawdata/9311_rice

# The number of total protein-coding genes
less 9311_glean_gene.gff | grep gene|grep -v Scaffold|grep -v Supscaffold | sort -k1,1 -k4,4g > tmp1.gff
less tmp1.gff | wc -l # 37878

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g 9311.chrom.sizes -s -l 0 -r 500 > tmp500.gff
bedtools flank -i tmp1.gff -g 9311.chrom.sizes -s -l 0 -r 1000 > tmp1000.gff
bedtools flank -i tmp1.gff -g 9311.chrom.sizes -s -l 0 -r 2000 > tmp2000.gff

# Filter the transposons of the chromosomes
tail +2 9311_repeat_Repbase.gff|grep Chr| sort -k1,1 -k4,4g > tmp2.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b tmp2.gff | wc -l  # 11436
bedtools intersect -u -wa -a tmp1000.gff -b tmp2.gff | wc -l  # 19401
bedtools intersect -u -wa -a tmp2000.gff -b tmp2.gff | wc -l  # 26636

# 11436/37878=30.2%
# 19401/37878=51.2%
# 26636/37878=70.3%

"""
	Solanum lycopersicum (ITAG2.4)
"""
cd rawdata/tomato_ITAG2.4

# The number of total protein-coding genes
less Sl_ITAG2.4_gene_models_sort_gff.txt|grep -v chr00 > tmp1.gff
less tmp1.gff | wc -l # 33838

# Refine the 500/1000/2000 bp region from the protein-coding genes
bedtools flank -i tmp1.gff -g Sl.chrom.sizes.txt -s -l 0 -r 500 > tmp500.gff
bedtools flank -i tmp1.gff -g Sl.chrom.sizes.txt -s -l 0 -r 1000 > tmp1000.gff
bedtools flank -i tmp1.gff -g Sl.chrom.sizes.txt -s -l 0 -r 2000 > tmp2000.gff

# Calculate the number of genes that have TEs in the refined regions above
bedtools intersect -u -wa -a tmp500.gff -b Sl_ITAG2.4_repeats_chr.gff3 | wc -l  # 11934
bedtools intersect -u -wa -a tmp1000.gff -b Sl_ITAG2.4_repeats_chr.gff3 | wc -l  # 17814
bedtools intersect -u -wa -a tmp2000.gff -b Sl_ITAG2.4_repeats_chr.gff3 | wc -l  # 23955

# 11934/33838=35.3%
# 17814/33838=52.6%
# 23955/33838=70.8%

