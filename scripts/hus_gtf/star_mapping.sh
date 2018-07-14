# mapping_star.sh # alignment script

#!/bin/sh -login
#PBS -l nodes=1:ppn=8,mem=32gb,walltime=20:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/data"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/scripts"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/output"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/genomeDir"

module load STAR/2.5.1b 

##STAR --runThreadN 7 --genomeDir /mnt/ls15/scratch/users/hussien/RNA_VAR/genomeDir --readFilesIn ${data_path}/ERR1050075_1.fastq ${data_path}/ERR1050075_2.fastq --outFileNamePrefix ${out_path} --outFilterMultimapNmax 1 --outReadsUnmapped Fastx --twopassMode Basic --limitBAMsortRAM 9000000000 --outSAMtype BAM SortedByCoordinate Unsorted --alignIntronMin 21 --alignIntronMax 6000 --quantMode GeneCounts

cd ${genome_path}/STAR_mapping

STAR --genomeDir ${genome_path}/build37 --readFilesIn ${data_path}/ERR1050075_1.fastq ${data_path}/ERR1050075_2.fastq  --runThreadN 7
