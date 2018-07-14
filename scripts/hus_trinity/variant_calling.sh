#variant_calling.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=2,mem=64gb,walltime=4:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR/genomeDir/"

module load Java/1.8.0_31
module load GATK


 java -Xmx10g -cp $GATK -jar $GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R ${genome_path}/GATK_indexed/GRCh38_r77.all.fa -I ${out_path}/GATK_out/split.bam -dontUseSoftClippedBases -stand_call_conf 20.0 -o ${out_path}/GATK_out/output.vcf

 
