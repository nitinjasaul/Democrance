# AWS Infra Using Terraform

### DESCRIPTION
In this project below services have been created -
1. **AWS VPC**      - In N. Virginia 
2.  **Subnet** -
         2 Public subnets have been created attached with Internet Gateway.
         1 Private subnet has been created attached with NAT Gateway.
3.  **Instance**     - 1 t2.micro instance using Debian AMI & NGinx installed (In Private Subnet).
4.  **LoadBalancer** - 1 Application LoadBalancer created with port 80 & 443 listeners (In Public Subnet).
5.  **RDS Instance** - 1 RDS Instance which is accessible through Debian Server (No Public Access).

NGinx server is being configured by Ansible and serving html page on self-signed certificate.


## COMMANDS TO RUN 

1.  ```terraform plan```
2.  ```terraform apply```
3.  ```ansible-playbook nginx.yml```


## TOOLS

Tools being used are:
1. Terraform
2. Ansible

## VARIABLES
  ### TERRAFORM VARIABLES:
```    PUBLIC_KEY_PATH: Path to your public ssh key
    aws_region: AWS region in which you want to create infra
    vpc_cidr: CIDR for VPC
    cidr_pub_1: CIRD for 1st public subnet
    cidr_pub_2: CIRD for 2nd public subnet
    cidr_pvt: CIRD for private subnet
    allowed_cidr_blocks: IPs for SSH access
    AMI: Image for AWS Instance
    rds_name: Name for RDS Instance
    database_name: Database Name
    database_user: Database Username
    database_password: Database Password
    rds_storage_type: RDS Instance storage type (i.e gp2, magnetic)
    rds_storage: Storage capacity (In GB)
    rds_engine: RDS engine type (i.e MySQL, Postgres)
    rds_engine_version: Version of RDS engine
    rds_instance_type: RDS instance type
    instance_type: EC2 instance type ```

  ### ANSIBLE VARIABLES:
    html_path: Root directory of code
    conf_file: Virtual host for NGinx
    dnsname: Domain name for SSl certificate
    sslpath: Path where SSL certificate will be stored
    private_key_password: Password for certificate generation
