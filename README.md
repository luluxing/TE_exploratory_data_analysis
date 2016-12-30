# TE_exploratory_data_analysis

## The percent of TEs in the genome

 |Arabidopsis|Maize|Rice|Tomato
---|---|---|---|---
TEs in genome|20.0%|79.9%|33.8%|54.8%

## The percent of protein-coding genes that have TEs within the 500/1000/2000 bp of start codons.

 |Arabidopsis|Maize|Rice|Tomato
---|---|---|---|---
500bp|18.1%|45.4%|37.8%|39.1%
1000bp|24.1%|66.9%|60.0%|58.4%
2000bp|31.5%|83.8%|78.5%|77.3%

## The percent of protein-coding genes that have TEs within the 500/1000/2000 bp of stop codons.

 |Arabidopsis|Maize|Rice|Tomato
---|---|---|---|---
500bp|12.6%|48.3%|30.2%|35.3%
1000bp|17.7%|66.7%|51.2%|52.6%
2000bp|25.2%|82.3%|70.3%|70.8%

## Simulated data to do TE position analysis again.

The simulation is run for 1000 times each.

 |Arabidopsis|Maize|Rice|Tomato
---|---|---|---|---
5'-500bp|25.9%|87.6%|46.9%|43.6%
3'-500bp|25.9%|87.6%|46.9%|43.5%
5'-1000bp|30.4%|91.2%|58.6%|48.9%
3'-1000bp|30.4%|91.2%|58.6%|48.9%
5'-2000bp|37.8%|95.0%|72.6%|55.9%
3'-2000bp|37.8%|95.0%|72.6%|55.8%

All the simulated results are significanyly (P-value < 0.01) higher than the true genome results. This implies that during the process of evolution, transposons tend to move away from both the 5' and 3' of the genes.

## Composition of the largest 5 kinds of TEs in the whole genome. 

Arabidopsis
  1. RC/Helitron 41.5%
  2. DNA/MuDR 17.3%
  3. LTR/Gypsy 13.4%
  4. DNA 5.9%
  5. LTR/Copia 5.7%
  
Rice
  1. DNA 21.8%
  2. MITE-tourist 19.3%
  3. MITE-stowaway 16.5%
  4. Gypsy 13.3%
  5. Retro 12.1%
  
Maize
  1. Gypsy 32.3%
  2. Copia 27.5%
  3. Unknown 20.2%
  4. CACTA 8.3%
  5. hAT 4.2%
  
Tomato
  1. LTR 60.2%
  2. LTR/Gypsy 24.5%
  3. LTR/Copia 11.4%
  4. DNA 1.7%
  5. SINE 1.1%
  
The composition in each plant is totally different. Different TE superfamilies may result from different ancestors. This could be investigated further to decide their evolution branch.

## GO analysis of genes which have TEs in their promoters (500bp upstream of start codon).

I use agriGO which is described here: Zhou Du, Xin Zhou, Yi Ling, Zhenhai Zhang, and Zhen Su agriGO: a GO analysis toolkit for the agricultural community Nucleic Acids Research Advance Access published on July 1, 2010, DOI 10.1093/nar/gkq310. Nucl. Acids Res. 38: W64-W70. 

The website is: http://bioinfo.cau.edu.cn/agriGO/index.php.

Arabidopsis

![alt text][./rawdata/arabidopsis_TAIR10/agriGO_left_500/biological\ process.png?raw=true "Biological process"]



  