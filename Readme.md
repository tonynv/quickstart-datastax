
# Intro

These templates will deploy a nested CFn stack containing:
- a VPC (note these templates don't contain a VPC template but refereence the AWS QS VPC template)
- an instance of OpsCenter
- between 1-4 DSE datacenters

# Quick deploy

You can deploy these templates with a single AWS CLI command, an example of which is in `deploy.sh`. You can run this script if you change the value of `KeyName` in the file `ci/simple-paramters.json` to be the name of a keypair that exists in your account in `us-east-1`. If deploying to a different region see parameter notes below. The expected output is:

```
jcp@tenkara:quickstart-datastax$ ./deploy.sh
{
    "StackId": "arn:aws:cloudformation:us-east-1:819041172558:stack/root-stack/99d2bd60-2143-11e7-86f1-503acac41e35"
}
```
Progess of the seployment can be watched in the CloudFormation web console.

# Deployment steps

The deployment goes through the following steps:

- `main.template` CFn stack created, contains the nested stacks, an S3 bucket (and assoc. resources), and a security group.
- nested `VPCStack` creates a 3 AZ VPC with pub/private subnets and associated resources.
- nested `OpsCenterstack` created, contains OpsCenter instance and performs cluster level (eg creation of LCM cluster, repo, ssh creds) setup. Once this stack posts `CREATE_COMPLETE` once can follow the `LCMURL` stack output to observe the progress of DC/node creation. Note: at this point OpsCenter auth is not yet turned on.
- multiple nested datacenter stacks `DC0-DC3`. Individual nodes post to LCM as they come up.
- after the last node posts to LCM, an install job is triggered. Its progress can be followed in the LCM web console. After this job completes deployment is finished.
- Note that while this install job is running there is a backgound task that turns on password auth for OpsCenter, and performs some cleanup.

# Parameters

- `KeyName`: Keypair to use for all instances. Keypair must exist in the region deploying to.
- `AvailabilityZones`: List of 3 AZs for VPC creation. AZs must match region deploying to.
- `ClusterName`: Name of the cluster.
- `DBPassword`: Password for default C* user _cassandra_.
- `OpsCPassword`: Password for OpsCenter default user _admin_.
- `NumberDCs`: Number of datacenters to create. **Important**: `NumberDCs` must equal the length of all list parameters and *all* lists must have the same length.
- `DataCenters`: List of strings, determines DC names.
- `DCSizes`: List of ints, determines # of nodes per DC.
- `Instances`: List of instance types.
- `VolumeSizes`: List of EBS volume sizes in GB.

# General Notes and Teardown
Since nested CFn stacks must have their templates served from S3, editing the templates locally will do **nothing** without putting the new versions in an S3 bucket and changing the `TemplateURL` references in `main.template`

Deleting the root stack (named `root-stack` in `deploy.sh`) will delete all nested stacks.
