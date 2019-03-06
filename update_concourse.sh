#!/bin/bash
# my-systemverilog-examples update_concourse.sh

fly -t ci set-pipeline -p my-systemverilog-examples -c ci/pipeline.yml --load-vars-from ../../.credentials.yml
