# syntplot
Scripts for plotting genome synteny based on BLAST alignment

## usage
`syntplot <name_of_genome1> <name_of_genome2> <sequence_of_genome1(.fasta)> <sequence_of_genome1(.fasta)>`
- spaces and special characters cannot be included in the arguments

## dependencies
- NCBI blast+
- seqkit
- Python 3
- R and following packages
  - ggplot2
  - scales

## examples
- multi fasta

`syntplot S.cerevisiae_S288C S.paradoxus_CBS432 Scer_GCF_000146045.2_nuc.fasta Spar_GCF_002079055.1_nuc.fasta`

- single fasta

`syntplot S.cerevisiae_S288C_mit S.paradoxus_CNS432_mit Scer_GCF_000146045.2_mit.fasta Spar_GCF_002079055.1_mit.fasta`

