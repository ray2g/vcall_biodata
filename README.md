# Vcall-pipeline - Docker Image
A variant calling pipeline based on GATK v4.1.7.0- docker image 


### How to run 

#### 1. Pull the Docker Image
```
docker pull ray2g/vcall_biodata:1.4
```

#### 2. Set the directory to be attached to the pipeline

```
mkdir vcall_biodata vcall_biodata/samples vcall_biodata/genome vcall_biodata/outputs vcall_biodata/outputs/logs
wget https://raw.githubusercontent.com/ray2g/vcall_biodata/master/config_pipeline.yaml -O vcall_biodata/config_pipeline.yaml
```

#### 3. Config the **config_docker.yaml** by changing the **paths**
#### 4. Fill samples and genome directories with the data 
#### 5. Run the pipeline:

```
docker run -v /<path>/vcall_biodata/:/mnt/share/ ray2g/vcall_biodata:1.4 snakemake --snakefile vcall-pipe.snake -p /mnt/share/outputs/<analysis_to_make> --cores <n_of_avaliable_cores> --resources gpu= <n_of_avaliable_gpus>

```

> ##### Possible Analysis:

> For Analisis of Copy-number Variants:
```
'{your_read}.vcf.gz'
```
> For Analisis of Copy-number Recalibrated Variants:
```
'{your_read}.recalibrated_variants_postCGP.vcf.gz'
```

##### 5.1
