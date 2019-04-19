#!/bin/sh
bucket=scotth-test

echo "Setting up $bucket"

aws s3 sync ./templates/ s3://$bucket/quickstart-datastax/templates/
aws s3 sync ./submodules/quickstart-aws-vpc/templates/ s3://$bucket/quickstart-datastax/submodules/quickstart-aws-vpc/templates/

aws cloudformation create-stack  --region us-west-2 --stack-name scotth-mp-dev  --disable-rollback  --capabilities CAPABILITY_IAM  --template-body file://$(pwd)/templates/quickstart-datastax-master.template  --parameters file://$(pwd)/minimal-west2.json
