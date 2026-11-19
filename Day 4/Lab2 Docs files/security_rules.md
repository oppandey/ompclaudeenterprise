# Security Rules - Sample Baseline

## S3
- R-S3-01: Public access must be blocked (BlockPublicAcls, BlockPublicPolicy, IgnorePublicAcls, RestrictPublicBuckets all true)
- R-S3-02: No public-read or public-read-write ACLs
- R-S3-03: Server-side encryption enabled (SSE-KMS preferred)

## Security Groups
- R-SG-01: No 0.0.0.0/0 or ::/0 ingress except TCP 443 (and 80 only if redirecting to 443)
- R-SG-02: SSH (22) and RDP (3389) must not be open to 0.0.0.0/0; restrict to bastion or corporate CIDR
- R-SG-03: Every security group must have a description

## Databases
- R-DB-01: StorageEncrypted must be true
- R-DB-02: PubliclyAccessible must be false
- R-DB-03: Master passwords must not be hardcoded; use Secrets Manager

## Tagging (all resources)
- R-TAG-01: owner, environment, cost_center tags required
