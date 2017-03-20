#!/bin/bash

# Changable parameters
####################################################
stack="opscenter-stack"
keyname="dse-keypair-us-east-1"
clustername="mycluster"
pw="secretpassword"
# List params
regions=\"us-east-1,us-east-1\"
dcs=\"dc0,dc1\"
dcsizes=\"3,3\"
keys=\"dse-keypair-us-east-1,dse-keypair-us-east-1\"
instances=\"m4.large,m4.large\"
volsizes=\"128,128\"
####################################################

template="$PWD/cfn-opscenter.json"
aws cloudformation create-stack \
--stack-name $stack \
--template-body file://$template \
--capabilities CAPABILITY_IAM \
--parameters \
ParameterKey=Regions,ParameterValue=$regions \
ParameterKey=DataCenters,ParameterValue=$dcs \
ParameterKey=DCSizes,ParameterValue=$dcsizes \
ParameterKey=Keys,ParameterValue=$keys \
ParameterKey=Instances,ParameterValue=$instances \
ParameterKey=VolumeSizes,ParameterValue=$volsizes \
ParameterKey=KeyName,ParameterValue=$keyname \
ParameterKey=ClusterName,ParameterValue=$clustername \
ParameterKey=DBPassword,ParameterValue=$pw
