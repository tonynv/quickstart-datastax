
# Info and Prerequisites

The purpose of the files in this directory are to make is quick and simple to deploy a multi-datacenter DSE cluster across AWS regions, however it can be used for a single region deployment. At this time the scripts don't take any arguments, changeable parameters are at the top of each script.

These scripts and templates use OpsCenter's Lifecycle Manager (LCM) to install and configure DSE. This is discussed [here](./LCM.md).

## Prerequisites

The only setup required is to install and configure the [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).  Documentation for the AWS CLI is [here](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-using-cli.html).  To configure the AWS CLI run the command `aws configure` and follow the prompts.
