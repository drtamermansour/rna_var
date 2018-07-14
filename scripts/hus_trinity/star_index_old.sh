#star-index.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=5,mem=64gb,walltime=8:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/genomeDir/"

module load STAR/2.5.1b

# Run STAR in " genomeGenerate " mode
#STAR --runThreadN 3 --runMode genomeGenerate --genomeDir /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/refGenome/starIndex1 --genomeFastaFiles /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/refGenome/Cmos_genome/Cmoschata_v1.chr.fa --sjdbGTFfile /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/refGenome/Cmos_genome/Cmos.gtf --sjdbOverhang 139 # should be read length minus 1 ; length of the genomic sequence around the annotated junction to be used for the splice junctions database


STAR --runThreadN 4 --runMode genomeGenerate --genomeDir ${genome_path}/GRCh38 star_indices_overhang100/ --genomeFastaFiles ${genome_path}/GRCh38_r77.all.fa --sjdbGTFfile ${genome_path}/Homo_sapiens.GRCh38.77.gtf --sjdbOverhang 100

