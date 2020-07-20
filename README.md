# Vcall-pipeline - docker image
A variant calling pipeline based on GATK v4.1.7.0- docker image 


### How to run it
1. Have [Docker](https://www.docker.com/get-started) installed
2. Open Command Prompt
3. In Command Prompt type: 

```
docker pull ray2g/vcall_biodata:latest
```
4. Set the directory to be attached to the pipeline and download GATK v.4.1.7.0

```
#Create directories
mkdir /<path>/vcall_biodata
mkdir /<path>/vcall_biodata/samples /<path>/vcall_biodata/genome /<path>/vcall_biodata/outputs

#Download and install GATK v4.1.7.0
wget https://github.com/broadinstitute/gatk/releases/download/4.1.7.0/gatk-4.1.7.0.zip -O /<path>/vcall_biodata/gatk-4.1.7.0
unzip /<path>/vcall_biodata/gatk-4.1.7.0
mv /<path>/vcall_biodata/gatk-4.1.7.0 /<path>/vcall_biodata/gatk
```

4. Config the config_docker.yaml by changing the paths
5. Fill samples and genome directories with the data 
6. In Command Prompt type:

```
docker run -v ~/vcall_biodata/:/mnt/share/ ray2g/vcall_biodata:latest -p /mnt/share/output/<analisis_to_make> --cores <n_of_avaliable_cores>
```
### Possible Analysis:

> For Analisis of Copy-number variantes:
```
'{your_read}.vcf.gz'
```
> For Analisis of Copy-number recalibrated variantes:
```
'{your_read}.recalibrated_variants_postCGP.vcf.gz'
```
