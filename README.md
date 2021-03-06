# Vcall-pipeline - Docker Image
A variant calling pipeline based on GATK v4.1.7.0 - docker image.
Prepared to be deployed in an HPC cluster using Slurm and Shifter.

----

<br>


### How to Run the Pipeline:

<br>

#### 1. Pull the Docker Image
```
$ docker pull ray2g/vcall_biodata:1.5.1
```

#### 2. Set the directory to be attached to the pipeline 
You can use the ```pipeline_directory_setup.sh``` script to do it.

```
$ mkdir vcall_biodata vcall_biodata/samples vcall_biodata/genome vcall_biodata/outputs vcall_biodata/outputs/logs
$ wget https://raw.githubusercontent.com/ray2g/vcall_biodata/master/config_pipeline.yaml -O vcall_biodata/config_pipeline.yaml
$ wget https://raw.githubusercontent.com/ray2g/vcall_biodata/master/vcall-pipe.snake -O vcall_biodata/vcall-pipe.snake
```
#### 3. Config the ```config_pipeline.yaml``` file with the correct **paths**
#### 4. Fill ```samples/``` and ```genome/``` directories with the analysis data.
#### 5. Run the pipeline:
```
docker run -v /<path>/vcall_biodata/:/mnt/share/ ray2g/vcall_biodata:1.5.1 \
snakemake --snakefile vcall-pipe.snake -p /mnt/share/outputs/<analysis_type> \
--cores <n_of_avaliable_cores> --resources gpu= <n_of_avaliable_gpus>
```

<br>

> #### Possible Analysis:

> For Analisis of Copy-Number Variants:
```
'{sample}_vcf.gz'
```

> For Analisis of Copy-Number Recalibrated Variants:
```
'{sample}.recalibrated_variants_postCGP.vcf.gz'
```
<br>

##### 5.1. HPC Deployment:

> 1. Pull the docker image with Shifter using Slurm:
```
## EXAMPLE BATCH FILE
#!/bin/bash
#SBATCH --job-name="vcall_test_analysis_bottle"
#SBATCH --output=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.out
#SBATCH --error=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.err
#SBATCH --time=72:00:00 
#SBATCH --mem=64421mb # memory limit per compute node
#SBATCH --nodes=1 # number of compute nodes
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16 

srun shifterimg pull ray2g/vcall_biodata:1.5.1
```

<br>

> 2. Running the pipeline with Shifter using Slurm:
```
## EXAMPLE BATCH FILE
#!/bin/bash
#SBATCH --job-name="vcall_test_analysis_bottle"
#SBATCH --output=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.out
#SBATCH --error=/home/<PATH>/slurm_test/vcall_test_analysis_bottle-%j.err
#SBATCH --time=72:00:00 
#SBATCH --mem=64421mb # memory limit per compute node
#SBATCH --nodes=1 # number of compute nodes
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16 
#SBATCH --volume="/home/<PATH>/vcall_biodata/:/mnt/"
#SBATCH --image=docker:ray2g/vcall_biodata:1.5.1

srun shifter --volume=/home/<PATH>/vcall_biodata/:/mnt/  \
--image=docker:ray2g/vcall_biodata:1.5.1 snakemake --snakefile /mnt/vcall-pipeline.snake \
-p /mnt/outputs/<analysis_type> --cores <n_of_avaliable_cores> --resources gpu= <n_of_avaliable_gpus>
```

<br>

> #### Possible Analysis:

> For Analisis of Copy-Number Variants:
```
'{sample}_vcf.gz'
```

> For Analisis of Copy-Number Recalibrated Variants:
```
'{sample}.recalibrated_variants_postCGP.vcf.gz'
```
