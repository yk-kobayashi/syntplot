# syntplot
Scripts for plotting genome synteny based on BLAST alignment

## usage
`syntplot <name_of_genome1> <name_of_genome2> <sequence_of_genome1(.fasta)> <sequence_of_genome1(.fasta)>`
- spaces and special characters cannot be included in the arguments
- compatible with both multi-fasta and single-fasta

## dependencies
- NCBI blast+
- seqkit
- Python 3
- R and following packages
  - ggplot2
  - scales

## output
A png file named "<name_of_genome1>vs<name_of_genome2>.png" will be created

## examples
- multi fasta

`syntplot S.cerevisiae_S288C S.paradoxus_CBS432 Scer_GCF_000146045.2_nuc.fasta Spar_GCF_002079055.1_nuc.fasta`
<img src="https://github.com/yk-kobayashi/images/blob/syntplot/S.cerevisiae_S288CvsS.paradoxus_CBS432.png" width="600">

- single fasta

`syntplot S.cerevisiae_S288C_mit S.paradoxus_CNS432_mit Scer_GCF_000146045.2_mit.fasta Spar_GCF_002079055.1_mit.fasta`
<img src="https://github.com/yk-kobayashi/images/blob/syntplot/S.cerevisiae_S288C_mitvsS.paradoxus_CNS432_mit.png" width="600">

## Acknowledgement
I acknowledge Dr Shunta Yorimoto for the basic idea of "geom-path"-based synteny plot
