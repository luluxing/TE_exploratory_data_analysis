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

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/arabidopsis_TAIR10/agriGO_left_500/go.png)

Almost all GO annotations are underrepresented except for excellular region, which is the only significant term in all GO terms. This verifies the above deduction, that TEs tend to move away from the genes.

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/arabidopsis_TAIR10/agriGO_left_500/significant.png)

Rice

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/9311_rice/agriGO_left_500/go.png)

There are 243 GO annotations that are significant. The majority of the GO annotations are overrepresented. Those genes are prone to have TEs in their promoters and may be regulated by TEs. There are also underrepresented GO annotations: cellular process, metabolic process, transcription regulator activity, catalytic activity and binding. For GO annotations in cellular component, all six significant terms are overrepresented.

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/9311_rice/agriGO_left_500/significant.png)

Maize

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/maize/agriGO_left_500/go.png)

The GO annotations in biological process and cellular components are overrepresented while in molecular function, conditions are complexed. There are five GO terms that are significant enriched: membrane, cell part, cell, catalytic activity and transferase activity.

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/maize/agriGO_left_500/significant.png)

Tomato

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/tomato_ITAG2.4/agriGO_left_500/go.png)

There are four GO annotaions significantly higher than the reference: ncRNA processing, ncRNA metabolic process, tRNA processing and tRNA metabolic process, all are involved in RNA processing. This may imply that TEs are likely to regulated the ncRNA process.

![alt tag](https://github.com/luluxing/TE_exploratory_data_analysis/blob/master/rawdata/tomato_ITAG2.4/agriGO_left_500/significant.png)

## Conclusions

* Maize have a relatively larger proportion of TEs in the genome.
* Genes that have TEs in near 3' region are fewer than the genes that have TEs in promoter region except for maize.
* The more TEs in the genome, the more genes that have TEs in their nearby regions.
* Real genes have far fewer TEs in their nearby regions than simulated genes (P-value < 0.01).
* TEs tend to be restrained in the intergenic regions.
* Different TE superfamilies have different composition parts in different plants. Although maize has the most TEs, there is not a single family that dominates.
* TEs are likely to affect gene annotated as extracellular regions in Arabidopsis; membrane, cell part, cell, catalytic activity and transferase activity in maize; ncRNA processing, ncRNA metabolic process, tRNA processing and tRNA metabolic process in tomato. While in rice, TEs may affect a large number of genes, like small molecule metabolic process, small molecule biosynthetic process and RNA metabolic process.
