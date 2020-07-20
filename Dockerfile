#Set OS
FROM continuumio/miniconda3:4.8.2


RUN apt-get update && apt-get upgrade -y

#Bioconda settup:
#Add the bioconda channel:
RUN conda config --add channels defaults --add channels bioconda --add channels conda-forge

#R,Picard Tools, MultiQCand snakemake(pipeline manager) install:
RUN conda install r=3.6 picard=2.22.4 multiQC=1.8 snakemake=5.3.0 -y

#Install Tools:
RUN conda install unzip bwa=0.7.17 samtools=1.9 samblaster=0.1.25 sambamba=0.7.1 vt=2015.11.10 bcftools=1.9 htslib=1.9 

#Copy files
RUN mkdir ~/vcall_biodata_docker
COPY ./* ~/vcall_biodata_docker/

#Set workdir
WORKDIR ~/vcall_biodata_docker/





