# mapping_star.sh # alignment script

#!/bin/sh -login
#PBS -l nodes=1:ppn=8,mem=32gb,walltime=16:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/data"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/scripts"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/output"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/genomeDir"

module load STAR/2.5.1b 


cd ${genome_path}/STAR_mapping

STAR --genomeDir ${genome_path}/GRCh38 --readFilesIn ${data_path}/SRR1153470_1.fastq ${data_path}/SRR1153470_2.fastq  --runThreadN 7
