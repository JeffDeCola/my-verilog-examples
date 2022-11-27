#!/bin/bash
# my-verilog-examples set-pipeline.sh

fly -t ci set-pipeline -p my-verilog-examples -c pipeline.yml --load-vars-from ../../../.credentials.yml
