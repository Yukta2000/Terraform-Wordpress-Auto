# Terraform-Wordpress-Auto
**This repo is for automating setup of configuring wordpress over AWS and AZURE**
## Pre-requisites
- Have account on AWS or AZURE having permissions to create instances/vm, rds/mysql_database,security_groups
- Have CLI(Azure/AWS as per need) configured for authentication 
- For AWS collect AMI ID, VPC-ID, Key name using which you want to launch as per the region and requirement
- Create a folder named keyfiles to store private keys and give appropriate path in code in vars.tf files

## Tailor code to your needs!!!
- You can give methods of authentication in providers.tf file in aws and azure folder as per need if you don't want to use CLI method for authentication
- Using vars.tf files you can change some values such as path where key is stored,name of vm,username,passwords,etc

## To launch successfully, run commands in following order:
- terraform plan -target module.wordpress.module.azure -out run.plan (***or terraform plan -target module.wordpress.module.aws -out run.plan***) 
- terraform apply run.plan -auto-approve
- terraform apply -auto-approve

**Blog Link for manually launching : https://yuktachakravarty.medium.com/configuring-wordpress-on-aws-5a87c2d6d230**
