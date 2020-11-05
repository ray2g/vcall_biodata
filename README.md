# Vcall-pipeline - Docker Image
A variant calling pipeline based on GATK v4.1.7.0- docker image 


### How to run 

#### 1. Pull the Docker Image
```
$ docker pull ray2g/vcall_biodata:1.4
```

#### 2. Set the directory to be attached to the pipeline

```
$ mkdir vcall_biodata vcall_biodata/samples vcall_biodata/genome vcall_biodata/outputs vcall_biodata/outputs/logs
$ wget https://raw.githubusercontent.com/ray2g/vcall_biodata/master/config_pipeline.yaml -O vcall_biodata/config_pipeline.yaml
```

#### 3. Config the **config_docker.yaml** by changing the **paths**
#### 4. Fill samples and genome directories with the data 
#### 5. Run the pipeline:

```
docker run -v /<path>/vcall_biodata/:/mnt/share/ ray2g/vcall_biodata:1.4 snakemake --snakefile vcall-pipe.snake -p /mnt/share/outputs/<analysis_to_make> --cores <n_of_avaliable_cores> --resources gpu= <n_of_avaliable_gpus>

```

> ### Possible Analysis:

> For Analisis of Copy-number Variants:
```
'{your_read}.vcf.gz'
```

> For Analisis of Copy-number Recalibrated Variants:
```
'{your_read}.recalibrated_variants_postCGP.vcf.gz'
```

##### 5.1 HPC Deployment

> 1. Pull the docker image with Shifter using Slurm:
```
## EXAMPLE BATCH FILE
#!/bin/bash
#SBATCH --job-name="vcall_test_analysis_bottle"
#SBATCH --output=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.out
#SBATCH --error=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.err
#SBATCH --mail-user=user@mail.com
#SBATCH --mail-type=ALL
#SBATCH --time=72:00:00 
#SBATCH --mem=7596mb # memory limit per compute node
#SBATCH --nodes=1 # number of compute nodes
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4 

srun shifterimg pull ray2g/vcall_biodata:1.4

```

> 2. Running the pipeline with Shifter using Slurm:
```
## EXAMPLE BATCH FILE
#!/bin/bash
#SBATCH --job-name="vcall_test_analysis_bottle"
#SBATCH --output=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.out
#SBATCH --error=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.err
#SBATCH --mail-user=user@mail.com
#SBATCH --mail-type=ALL
#SBATCH --time=72:00:00 
#SBATCH --mem=7596mb # memory limit per compute node
#SBATCH --nodes=1 # number of compute nodes
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4 
#SBATCH --volume="/home/<PATH>/:/mnt/"
#SBATCH --image=docker:ray2g/vcall_biodata:1.4

srun shifter --volume=/home/ubuntu/vcall_docker_gatk4_bottle/:/mnt/  \
--image=docker:ray2g/vcall_biodata:1.4 snakemake --snakefile /mnt/vcall-pipeline.snake \
-p /mnt/outputs/NIST7035.recalibrated_variants_postCGP.vcf.gz --cores 4
```


```

> ### Possible Analysis:

> For Analisis of Copy-number Variants:
```
'{your_read}.vcf.gz'
```

> For Analisis of Copy-number Recalibrated Variants:
```
'{your_read}.recalibrated_variants_postCGP.vcf.gz'
```
