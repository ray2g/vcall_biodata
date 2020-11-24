!#/bin/bash

shifter --volume=/home/ubuntu/vcall_docker_gatk4_bottle/:/mnt/  \
--image=docker:ray2g/vcall_biodata:1.5.1 snakemake --snakefile /mnt/vcall-pipe_cluster.snake \
-p /mnt/outputs/NIST7035.recalibrated_variants_postCGP.vcf.gz \
--cluster 'sbatch -p {params.partition} -t {resources.time_min} --mem={resources.mem_mb} -c {resources.cpus}' -j 24 --forceall #--unlock
