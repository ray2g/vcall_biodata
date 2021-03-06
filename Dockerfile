## DOCKER IMAGE -- VERSION 1.5.1

#Set the Dependencies Environment 
FROM continuumio/miniconda3:4.5.12

RUN apt-get update && apt-get upgrade -y

# Conda setup:
# Add the bioconda channel:
RUN echo "Creating Conda Environment..."
RUN conda config --add channels defaults --add channels bioconda --add channels conda-forge

# Crete the conda ENV with the necessary tools:
RUN conda upgrade -n base -c defaults --override-channels conda
RUN conda install r=3.6 picard=2.22.4 multiQC=1.8 snakemake=5.3.0 unzip bwa=0.7.17 samtools=1.9 samblaster=0.1.24 sambamba=0.6.8 vt=2015.11.10 $
RUN conda install -c r r-ggplot2

# Download GATK tools
RUN echo "Downloading GATK Tools"
RUN wget https://github.com/broadinstitute/gatk/releases/download/4.1.7.0/gatk-4.1.7.0.zip
RUN unzip gatk-4.1.7.0.zip
RUN mv gatk-4.1.7.0 gatk


