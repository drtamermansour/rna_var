#star-index.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=5,mem=64gb,walltime=8:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/genomeDir/"

module load STAR/2.5.1b

STAR --runThreadN 4 --runMode genomeGenerate --genomeDir ${genome_path}/GRCh38 star_indices_overhang100/ --genomeFastaFiles ${genome_path}/GRCh38_r77.all.fa --sjdbGTFfile ${genome_path}/Homo_sapiens.GRCh38.77.gtf --sjdbOverhang 100


