#!/bin/sh
echo "validate templates"
echo "master"
aws cloudformation validate-template --template-body file://$(pwd)/templates/quickstart-datastax-master.template
echo "novpc"
aws cloudformation validate-template --template-body file://$(pwd)/templates/quickstart-datastax-no-vpc.template
echo "datastax"
aws cloudformation validate-template --template-body file://$(pwd)/templates/opscenter.template
echo "datacenter"
aws cloudformation validate-template --template-body file://$(pwd)/templates/datacenter.template


