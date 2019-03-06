#!/bin/bash
# my-php-containers update_concourse.sh

fly -t ci set-pipeline -p my-php-containers -c ci/pipeline.yml --load-vars-from ../../.credentials.yml
