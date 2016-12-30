################################################
##	Calculate the percent of TEs in the genome.
################################################
################################################
##	Arabidopsis thaliana (TAIR10)
################################################
cd rawdata/arabidopsis_TAIR10

less TAIR10.chrom.sizes | perl -lane '{$a+=$F[1]}END{print $a,"\n"}' # 119146348
sort -k1,1 -k4,4g TAIR10_TE.gff | bedtools merge -i - | perl -lane '{$a += $F[2]-$F[1]+1}END{print $a,"\n"}' # 23884325

# 23884325/119146348=20.0%

################################################
##	Zea mays (B73)
################################################
cd rawdata/maize

less Zm.chrom.sizes | perl -lane '{$a+=$F[1]}END{print $a,"\n"}' # 2065722704
sort -k1,1 -k4,4g ZmB73_5a_MTEC_repeats.gff | bedtools merge -i - | perl -lane '{$a += $F[2]-$F[1]+1}END{print $a,"\n"}' # 1650866816

# 1650866816/2065722704=79.9%

################################################
##	Oryza sativa (9311)
################################################
cd rawdata/9311_rice

less 9311.chrom.sizes | perl -lane '{$a+=$F[1]}END{print $a,"\n"}' # 374545499
sort -k1,1 -k4,4g 9311_repeat_Repbase.gff | bedtools merge -i - | perl -lane '{$a += $F[2]-$F[1]+1}END{print $a,"\n"}' # 126739746

# 126739746/374545499=33.8%

################################################
##	Solanum lycopersicum (ITAG2.4)
################################################
cd rawdata/tomato_ITAG2.4

less Sl.chrom.sizes.txt | perl -lane '{$a+=$F[1]}END{print $a,"\n"}' # 823944041
sort -k1,1 -k4,4g Sl_ITAG2.4_repeats_chr.gff3 | bedtools merge -i - | perl -lane '{$a += $F[2]-$F[1]+1}END{print $a,"\n"}' # 451142838

# 451142838/823944041=54.8%