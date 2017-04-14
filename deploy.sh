#!/bin/bash

aws cloudformation create-stack  \
--region us-east-1 \
--stack-name root-stack  \
--disable-rollback  \
--capabilities CAPABILITY_IAM  \
--template-body file://$(pwd)/templates/main.template  \
--parameters file://$(pwd)/ci/parameters.json
