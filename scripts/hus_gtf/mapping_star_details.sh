##Mapping with STAR

-running STAR aligner
#1-convert gff3 to gtf file

module load cufflinks
gffread Cmos.gff3  -T -o Cmos.gtf

##2-making genome index

# create a directory to store the index in
mkdir starIndex1

#star-index.sh

#!/bin/sh -login
#PBS -l nodes=1:ppn=1,mem=8gb,walltime=5:00:00
#PBS -M safa@msu.edu
#PBS -m abe

module load STAR/2.5.1b

# Run STAR in " genomeGenerate " mode
STAR --runThreadN 3 --runMode genomeGenerate --genomeDir /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/refGenome/starIndex1 --genomeFastaFiles /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/refGenome/Cmos_genome/Cmoschata_v1.chr.fa --sjdbGTFfile /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/refGenome/Cmos_genome/Cmos.gtf --sjdbOverhang 139 # should be read length minus 1 ; length of the genomic sequence around the annotated junction to be used for the splice junctions database

##3-Alignment of reads to the genome.

#make a folder to store the STAR output in
$ mkdir alignment_STAR
# list fastq files separated by comma without whitespaces
$ ls -m /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/*fastq | sed 's/ //g'
# execute STAR in the default runMode " alignReads "

STAR --runThreadN 1 \ # can be increased if sufficient computational power is available
--genomeDir ${ REF_DIR }/ STARindex / \
--readFilesIn raw_reads / ERR458493 . fastq .gz , raw_reads / ERR458494 . fastq .gz ,
raw_reads / ERR458495 . fastq .gz , raw_reads / ERR458496 . fastq .gz , raw_reads /
ERR458497 . fastq .gz , raw_reads / ERR458498 . fastq .gz , raw_reads / ERR458499 .
fastq .gz \
--outFileNamePrefix alignment_STAR / WT_1_ \ #/path/to/output/dir/prefix
--outFilterMultimapNmax 1 \ # only reads with 1 match in the reference will be returned as aligned
--outReadsUnmapped Fastx \ # will generate an extra output file with the unaligned reads
--twopassMode Basic\ # STAR will perform mapping , then extract novel junctions which will be inserted into the genome index which will then be used to re - map all reads
--outSAMtype BAM SortedByCoordinate Unsorted \ #Mapping reads and generating unsorted and coordinate-sorted BAM files, BAM conversion and coordinate-sorting while mapping
--alignIntronMin 21 --alignIntronMax 1000000 \
--quantMode GeneCounts \ #STAR will count number reads per gene while mapping, A read is counted if it overlaps (1nt or more) one and only one gene, The counts coincide with those produced by htseq-count with default parameters, STAR outputs read counts per gene into ReadsPerGene.out.tab file


#Note# If you have multiple files you wish to map in one run, they should be separated by commas, while paired-end mates are separated by space:
# --readFilesIn Read1a.gz,Read1b.gz Read2a.gz,Read2b.gz

# mapping_star.sh # alignment script

#!/bin/sh -login
#PBS -l nodes=1:ppn=8,mem=260gb,walltime=20:00:00
#PBS -M safa@msu.edu
#PBS -m abe

module load STAR/2.5.1b

1- 
STAR --runThreadN 7 --genomeDir /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/refGenome/starIndex1 --readFilesIn /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/pairedReads/C14-1_S1_L004_R1_001_paired.fastq /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/pairedReads/C14-1_S1_L004_R2_001_paired.fastq --outFileNamePrefix /mnt/ls15/scratch/users/safa/squashProject/20170519_mRNASeq_PE/raw-data/alignment_STAR/C14-1 --outFilterMultimapNmax 1 --outReadsUnmapped Fastx --twopassMode Basic --limitBAMsortRAM 9000000000 --outSAMtype BAM SortedByCoordinate Unsorted --alignIntronMin 21 --alignIntronMax 6000 --quantMode GeneCounts
