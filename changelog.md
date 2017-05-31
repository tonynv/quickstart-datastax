# Changelog

- split S3 role into specific OpsCenter and node roles

---
## Previous Commits
---
- add version of root template to deploy to an existing VPC
---
- set top level defaults (give 1 DC+3 nodes), add minimal.json as example minimal params
(doesn't include QSS3 params)
- add repo credentials as top level parameters
- literal quoting of string args
- peg to install scripts release 5.5.4 (not master)
- re-org Outputs
- move EBS mnt point
---
- OpsC REST call made to private ip
- all calls to S3 wrapped in basic retry logic
- node shell blocked with `waitForJobs.py` to delay CREATE_COMPLETE until after LCM jobs finish
- HTTP (port 8888) restricted to private ips
- HTTPS (port 8443) turned on as last deploy step, output URLs changed
- DC `DependsOn` changed to VPCStack from OpsCenterStack
