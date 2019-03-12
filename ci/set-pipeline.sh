#!/bin/bash
# my-systemverilog-examples set-pipeline.sh

fly -t ci set-pipeline -p my-systemverilog-examples -c pipeline.yml --load-vars-from ../../../.credentials.yml
