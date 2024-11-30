## Module to create VPC

### Mandatory input variables

This modules need few config details which can be passed via variables:
```
- vpc_cidr_block : cidr value for vpc, for example 10.0.0.0/16
- subnet1_cidr_block : cidr value for subnet1, for example 10.0.0.0/24
- subnet2_cidr_block : cidr value for subnet2, for example 10.0.1.0/24
- availability_zone1 : name of the availability zone where the instance should run, for example ap-southeast-1
- availability_zone2 : name of the availability zone where the instance should run, for example ap-southeast-2
```