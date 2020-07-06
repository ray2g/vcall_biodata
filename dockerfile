#Set OS
FROM continuumio/miniconda3:4.8.3

WORKDIR /mnt/share/repo/vcall_biodata/

RUN apt-get update && apt-get upgrade -y

#Bioconda settup:
#Add the bioconda channel:
RUN conda config --add channels defaults --add channels bioconda --add channels conda-forge

#R,Picard Tools, MultiQCand snakemake(pipeline manager) install:
RUN conda install r=3.6 picard=2.22.4 multiQC=1.8 snakemake=5.3.0 -y

#Install Tools:
RUN conda install unzip bwa=0.7.17 samtools=1.9 samblaster=0.1.25 sambamba=0.7.1 vt=2015.11.10 bcftools=1.9 htslib=1.9 

#Create directories

RUN mkdir genome samples output logs gatk

#Download and install GATK v4.1.7.0
RUN wget /mnt/share/repo/vcall_biodata/gatk/https://github.com/broadinstitute/gatk/releases/download/4.1.7.0/gatk-4.1.7.0.zip
RUN unzip /mnt/share/repo/vcall_biodata/gatk/https://github.com/broadinstitute/gatk/releases/download/4.1.7.0/gatk-4.1.7.0.zip


