#!/bin/bash

aws cloudformation create-stack  --stack-name root-stack  --disable-rollback  --capabilities CAPABILITY_IAM  --template-body file://$(pwd)/main.template  --parameters file://$(pwd)/parameters.json
