# Changelog

---
- OpsC REST call made to private ip
- all calls to S3 wrapped in basic retry logic
- node shell blocked with `waitForJobs.py` to delay CREATE_COMPLETE until after LCM jobs finish
- HTTP (port 8888) restricted to private ips
- HTTPS (port 8443) turned on as last deploy step, output URLs changed
- DC `DependsOn` changed to VPCStack from OpsCenterStack
