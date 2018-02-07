# Changelog

- install scripts to 6.1.0
- all LCM REST calls use https/auth
- OpsC PW params added/passed to datacenter.template
- shell cleanup

---
## Previous Commits
---
- versions to DSE 5.1.6, OpsC 6.1.5, scripts 6.0.4. Fixes java 8u162 startup bug.
- increase CassandraGroup timeout to 35m

---
- versions to DSE 5.1.5, OpsC 6.1.4, scripts 6.0.1. Fixes JCE download bug.
---
- bug fix for passing `DCSizes` param to opscenter.template in no-vpc template
---
- bump versions: DSE -> 5.1.3, OpsCenter -> 6.1.3, install scripts -> 6.0.0
- LCM install job triggered from OpsCenter instance, required shifting params
from `datacenter.template` to `opscenter.template`. No top-level param changes.
- calling `alterKeyspaces.py` in post-install cleanup
---
- change EIP declaration (failed in some accounts)
- fix param description error
- bump versions to DSE 5.1.2, OpsC 6.1.2
- i3 instance type
- fix cfn-auto-reloader.conf
---
- update parameter descriptions to match edited deployment guide
---
- pass region to CLI s3 calls
---
- switch to passing db password to all dc's
---
- split S3 role into specific OpsCenter and node roles
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
