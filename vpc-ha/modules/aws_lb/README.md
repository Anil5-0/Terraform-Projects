## Module to create Load Balancer, Listeners and Target groups

### Mandatory input variables

This modules need few config details which can be passed via variables:
```
- lb_type : name the type of load balancer, for example application or network
- vpc_id : id of the vpc 
- subnet1_id : id of the subnet1 in which lb should be created
- subnet2_id : id of the subnet2 in which lb should be created
- instance1_id : id of the ec2 instance1
- instance2_id : id of the ec2 instance2
- instance_profile_name : name of ec2 instance profile
- sg_id : value of the sg id to be attached with lb
```