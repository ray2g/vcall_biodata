# vcall_biodata
A variant calling pipeline based on GATK v4.1.7.0- docker image 


### How to run it
1. Have [Docker](https://www.docker.com/get-started) installed
2. Open Command Prompt
3. In Command Prompt type: 

```
docker pull ray2g/vcall_biodata:latest
```
4. Config the config_docker.yaml by changing the paths
5. Fill samples and genome directories with the data 
6. In Command Prompt type:

```
docker run -v ~/vcall_biodata/:/mnt/share/ ray2g/vcall_biodata:latest -p /mnt/share/output/<analisis_to_make> --cores <n_of_avaliable_cores>
```
# Possible Analysis:

> For Analisis of Copy-number variantes:
```
'{your_read}.vcf.gz'
```
> For calculate genotype posteriors:
```
'{your_read}.recalibrated_variants_postCGP.vcf.gz'
```
