# aws-autoscale-Website-Deployment

Following AWS services will be use 

- VPC
- Two Subnets
- Security Groups
- Internet Gateway 
- Route Table 
- Security Group for ELB
- ELB
- Launch Configuration
- User Data which having install the nginx on ec2 instances and available port 80
- Autoscaling group

## Variables

| Variable      | Default Value | Description |
| ------------- | ------------- | ------------- | 
| TagName       | Development   | Tag name could be anything for the reference of the deployment |
| VPC_cidr_block | 10.0.0.0/16  | This is your VPC Cidr value |
| KeyPair_Name | use user key pair  | Key pari to use for SSH |
| Instance_Image_Id | ami-0b69ea66ff7391e80  | Amazon Linux |
| Instance_Type | t2.micro  | Amazon Linux Instance Type |