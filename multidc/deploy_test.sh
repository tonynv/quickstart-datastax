#!/bin/bash

# Changable parameters
####################################################
keyname="dse-keypair-us-east-1"
clustername="mycluster"
####################################################

template="$PWD/cfn-opscenter.json"
stack="opscenter-stack"
aws cloudformation create-stack \
--stack-name $stack \
--template-body file://$template \
--capabilities CAPABILITY_IAM \
--parameters \
ParameterKey=Regions,ParameterValue=\"us-east-1,us-east-1,us-east-1\" \
ParameterKey=DataCenters,ParameterValue=\"dc0,dc1,dc2\" \
ParameterKey=DCSizes,ParameterValue=\"4,5,5\" \
ParameterKey=Keys,ParameterValue=\"dse-keypair-us-east-1,dse-keypair-us-east-1,dse-keypair-us-east-1\" \
ParameterKey=Instances,ParameterValue=\"t2.medium,m4.large,m4.large\" \
ParameterKey=VolumeSizes,ParameterValue=\"25,25,25\" \
ParameterKey=KeyName,ParameterValue=$keyname \
ParameterKey=ClusterName,ParameterValue=$clustername \

#region=$(aws configure get default.region)
#echo "$stack $region" >> teardown.txt
