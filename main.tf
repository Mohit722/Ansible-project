# Define necessary variables and the AWS provider:
     

     provider "aws" {
       region = "ap-south-1"
     }

     variable "BuildAMI" {
       description = "Build Server AMI"
       default     = "ami-0522ab6e1ddcc7055"
     }

     variable "BuildType" {
       description = "Build Server Type"
       default     = "t2.micro"
     }

     variable "BuildKey" {
       description = "Build Server Key"
       default     = "master"
     }

     variable "BuildUser" {
       description = "Build User"
       default     = "ubuntu"
     }
     

# Define the AWS EC2 instance and use a local-exec provisioner to run Ansible:
     
     resource "aws_instance" "example" {
       ami           = var.BuildAMI
       instance_type = var.BuildType
       key_name      = var.BuildKey

       provisioner "local-exec" {
         command = "export ANSIBLE_HOST_KEYCHECKING=False; sleep 30; ansible-playbook buildsetup.yml -i ${aws_instance.example.private_ip}, -u ${var.BuildUser} --keyfile /etc/ansible/${var.BuildKey}.pem"

       }
     }


#Provisioner: Terraform will execute this command as soon as the machine is created.
# Ansible Command: Runs the `buildsetup.yml` playbook on the newly created machine using its private IP

