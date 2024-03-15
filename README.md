# Web Server Example
This folder contains an example Terraform configuration that deploys a cluster of web servers (using EC2 and Auto Scaling) and a load balancer (using ELB) in an Amazon Web Services (AWS) account. The load balancer listens on port 80 and returns the text "Hello, World" for the / URL.

## Pre-requisites
- Terraform installed on your computer.
- Amazon Web Services (AWS) account.

## Configure your AWS access keys as environment variables:
```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Deploy the code:
```
terraform init  
terraform apply
```
If you want to execute as non-interactive way, type:
```
terraform apply --auto-approve
```

When the apply command completes, it will output the DNS name of the load balancer. To test the load balancer:

```
curl http://<alb_dns_name>/
```
Clean up
```
terraform destroy
```
