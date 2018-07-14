

#!/bin/sh -login
#PBS -l nodes=1:ppn=4,mem=64gb,walltime=20:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/genomeDir/"


module load vcftools

vcftools --gzvcf  ${out_path}/GATK_out/Genome_var.vcf.gz --recode --bed ${out_path}/GATK_out/out_split_clustered_5 --out ${out_path}/GATK_out/out_vcf_bed_5

