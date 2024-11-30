## Module to create EC2 instance

### Mandatory input variables

This modules need few config details which can be passed via variables:
```
- vpc_id : id of the vpc
- ami_id : value of ami id to be used, for example ami-047126e50991d067b
- instance_type : value of the instance type, for example t2.micro 
- subnet1_id : value of the subnet id associated with subnet1
- subnet2_id : value of the subnet id associated with subnet2
- instance_profile_name : name of ec2 instance profile
- sg_id : value of the sg id to be attached with ec2
```