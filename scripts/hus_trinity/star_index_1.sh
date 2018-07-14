#star-index_1.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=5,mem=64gb,walltime=4:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/genomeDir/"

module load STAR/2.5.1b

# Run STAR in " genomeGenerate " mode

STAR --runMode genomeGenerate --genomeDir ${genome_path}/new_index --genomeFastaFiles ${genome_path}/GRCh38_r77.all.fa --sjdbFileChrStartEnd ${genome_path}/STAR_mapping/SJ.out.tab --sjdbOverhang 75 --runThreadN 4
