#Picard.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=16,mem=128gb,walltime=24:00:00
#PBS -M hussien@msu.edu
#PBS -m abe

data_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/data/"
script_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/scripts/"
out_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/output/"
genome_path=$"/mnt/ls15/scratch/users/hussien/RNA_VAR_gtf/genomeDir/"

module load Java/1.8.0_31
module load GATK

 #java -Xmx10g -cp $GATK -jar $GATK/GenomeAnalysisTK.jar -T SplitNCigarReads -R ${genome_path}/GATK_indexed/build37.fa -I ${genome_path}/Picard_index/Build_37_dedupped.bam -o ${out_path}/GATK_out/split.bam -rf ReassignOneMappingQuality -RMQF 255 -RMQT 60 -U ALLOW_N_CIGAR_READS


java -Xmx10g -cp $GATK -jar $GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R ${genome_path}/GATK_indexed/build37_corID.fa -I ${out_path}/GATK_out/split.bam -dontUseSoftClippedBases -stand_call_conf 20.0 -o ${out_path}/GATK_out/output_forcedbam.vcf -bamout ${out_path}/GATK_out/bamout_forcedbam.bam -forceActive -disableOptimizations 
