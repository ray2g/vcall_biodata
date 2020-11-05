## DOCKER IMAGE -- VERSION 1.4

#Set OS
FROM continuumio/miniconda3:4.8.2

RUN apt-get update && apt-get upgrade -y

# Conda setup:
# Add the bioconda channel:
RUN echo "Creating Conda Environment..."
RUN conda config --add channels defaults --add channels bioconda --add channels conda-forge

# Crete the conda ENV with the necessary tools:
RUN conda install r=3.6 picard=2.22.4 multiQC=1.8 snakemake=5.3.0 unzip bwa=0.7.17 samtools=1.9 samblaster=0.1.25 sambamba=0.7.1 vt=2015.11.10 bcftools=1.9 htslib=1.9 -y

# Download GATK tools
RUN echo "Downloading GATK Tools"
RUN wget https://github.com/broadinstitute/gatk/releases/download/4.1.7.0/gatk-4.1.7.0.zip 
RUN unzip gatk-4.1.7.0.zip
RUN mv gatk-4.1.7.0 gatk
RUN rm gatk-4.1.7.0.zip

# Download vcall pipeline 
RUN wget https://raw.githubusercontent.com/ray2g/vcall_biodata/master/vcall-pipe.snake
