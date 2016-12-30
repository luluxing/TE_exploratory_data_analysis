#####################################################################
##	Calculte the TE composition of each plant.
#####################################################################
#####################################################################
##	Arabidopsis thaliana (TAIR10)
#####################################################################
tail +1 rawdata/arabidopsis_TAIR10/TAIR10_Transposable_Elements.txt |wc -l # 31190
tail +1 rawdata/arabidopsis_TAIR10/TAIR10_Transposable_Elements.txt | cut -f6|sort|uniq -c|sort -k1,1g|awk '$1/=31190'|less

#####################################################################
##	Oryza sativa (9311)
#####################################################################
wc -l rawdata/9311_rice/tmp2.gff # 353999
cut -f9 rawdata/9311_rice/tmp2.gff | cut -d ';' -f3 | cut -d '=' -f2 | sort|uniq -c|sort -k1,1g|awk '$1/=353999'|less

#####################################################################
##	Zea mays (B73)
#####################################################################
wc -l rawdata/maize/tmp2.gff # 1963994
cut -f9 rawdata/maize/tmp2.gff | cut -d ';' -f4|cut -d '=' -f2|sort|uniq -c|sort -k1,1g|awk '$1/=1963994'|less

#####################################################################
##	Solanum lycopersicum (ITAG2.4)
#####################################################################
wc -l rawdata/tomato_ITAG2.4/tmp2.gff # 719453
cut -f9 rawdata/tomato_ITAG2.4/tmp2.gff |cut -d ';' -f2|cut -d '=' -f2|sort|uniq -c|sort -k1,1g|awk '$1/=719453'|less