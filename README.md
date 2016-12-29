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
5'-500bp|25.9%||46.9%|
3'-500bp|25.9%||46.9%|
5'-1000bp|30.4%||58.6%|
3'-1000bp|30.4%||58.6%|
5'-2000bp|37.8%||72.6%|
3'-2000bp|37.8%||72.6%|

All the simulated results are significanyly (P-value < 0.01) higher than the true genome results. This implies that during the process of evolution, transposons tend to move away from both the 5' and 3' of the genes.