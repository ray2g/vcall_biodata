#!/bin/bash

# turn it a executable file: $ sudo chmod +x pipeline_directory_setup.sh
# execute it: $ ./pipeline_directory_setup.sh # to create the structured directory

#script:

mkdir vcall_biodata vcall_biodata/samples vcall_biodata/genome vcall_biodata/outputs vcall_biodata/outputs/logs
wget https://raw.githubusercontent.com/ray2g/vcall_biodata/master/config_pipeline.yaml -O vcall_biodata/config_pipeline.yaml
wget https://raw.githubusercontent.com/ray2g/vcall_biodata/master/vcall-pipe.snake -O vcall_biodata/vcall-pipe.snake

