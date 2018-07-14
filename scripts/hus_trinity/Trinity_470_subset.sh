#Trinity_470.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=8,mem=64gb,walltime=24:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_Trinity/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_Trinity/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_Trinity/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_Trinity/genomeDir/"

module swap GNU GNU/4.9
module load trinity/2.4.0
Trinity --seqType fq --max_memory 60G --no_path_merging --left ${data_path}/SRR1153470_1_subset.fastq --right ${data_path}/SRR1153470_2_subset.fastq --output ${out_path}/trinity_out_470_subset --CPU 6
