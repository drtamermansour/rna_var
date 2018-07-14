#Picard.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=4,mem=64gb,walltime=4:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_NEW/genomeDir/"

#module load STAR/2.5.1b

# Run STAR in " genomeGenerate " mode

module load Java/1.8.0_31
module load  picardTools/1.89
#java -jar $PICARD/AddOrReplaceReadGroups.jar I=${genome_path}/STAR_mapping_1/Aligned.out.sam O=${genome_path}/Picard_index/rg_added_sorted.bam SO=coordinate RGID=id RGLB=library RGPL=platform RGPU=machine RGSM=sample
java -jar $PICARD/MarkDuplicates.jar I=${genome_path}/Picard_index/rg_added_sorted.bam O=${genome_path}/Picard_index/dedupped.bam  CREATE_INDEX=true VALIDATION_STRINGENCY=SILENT M=output.metrics
