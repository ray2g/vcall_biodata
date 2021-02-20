#!/bin/bash

shifter --volume=/home/ubuntu/vcall_docker_gatk4_bottle/:/mnt/  \
--image=docker:ray2g/vcall_biodata:1.5.1 \
snakemake --snakefile /mnt/vcall-pipe2_cluster.snake \
-p /mnt/outputs/NIST7035_recalibrated_vcf.gz \
--cluster 'sbatch -p {params.partition} --mem {resources.mem_mb}mb --cpus-per-task {resources.cpus}' \
-j 24 --forceall #--unlock




