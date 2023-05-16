terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "EC2Instance" {
    ami = "ami-072276e586375df1d"
    instance_type = "t2.micro"
    key_name = "My APJ SE Sydney Key Pair"
    availability_zone = "ap-southeast-2a"
    tenancy = "default"
    subnet_id = "subnet-01a44f8b6249180b3"
    ebs_optimized = false
    vpc_security_group_ids = [
        "sg-002ec7c65880d96c1"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
    }
    tags = {
        Name = "MyMongoDBServer"
    }
}

resource "aws_instance" "EC2Instance2" {
    ami = "ami-0b334634a6fabcc4a"
    instance_type = "t3.medium"
    availability_zone = "ap-southeast-2a"
    tenancy = "default"
    subnet_id = "subnet-082449d215e151f66"
    ebs_optimized = false
    vpc_security_group_ids = [
        "sg-0c8edf1a6ab4431e7",
        "sg-0c8edf1a6ab4431e7"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 80
        volume_type = "gp3"
        delete_on_termination = true
    }
    user_data = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVWWGhPUkVFeFRWUnJlVTVXYjFoRVZFMTZUVVJWZUUxVVFURk5WR3Q1VGxadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJTeTl1Q25CbmVrMURiV3haVDFndlp6RkRWamMxVUV0dlJqaEJUMWQ1Y3pkNU5rUTVlbGhaYzFZMlJtWnVaRWx1Vm5GVVdqVnhNR0pzV0VSSmEyUTFPRVpRTVhRS05GZHRSbkJRVmpaUU5TOXJhMWMxVG5GaE9UUnphV0Z4V1dKSWRWSmxhVkpxVURVdk1sQlFkMk54YlVWdGRHRnNORGh4WVdwUFoxcFJTMHBJWjA1NlpncEVXV2xCV1hoM1R6aHJhMmRNYmtkdVFYVkljRnBVUWpCWGN6UkNSekUzU0hORFVrRm9iazVLTjJOYVRUTnFVbWczVW14eE0yVnNjRGQzZEROelRsTnRDa3RaTlZSYVZGSXdTVk4yT0dkS1pFcFVZMk4zVGpsUVExZExXRE5aVjNKb1NqRXdZakEwUVZkU1lYVkhkbkpPVkZNeE9FTkJPRWRWYW5oamRHZFNXbFVLYVdSR01VY3ZSMlZFYXl0U1F6SkJkVnBZWlN0dGFWTlZhRWh1Y0U5WWJXZHRNR3B1VkdSc1FqQnZlV0ZWTDFrMFdIcFJURXB4Tnl0WE5GRnZhRTluT1FwdldGcG1PV2M1V2pORE4wVTBOVlpSZW5KTlEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaTUsyNXBXVXB1ZWxoNFVVRmhSVkp2TlZoeFZrVkljekp0ZEdwTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJTV2h6WjB3ME5WZHVaalpTVjBaUk9UaEpjQXA2YUZOd1RGWk1hbFpETlhWbE9HdHpaVmhoZWpaVE5sZzRjM2RSYXpoQmJYUm9NRmhoTlhVeVFsZFdRaXRoUlRBME5WcHNXQ3RsZW05U1NWQkdaM1ZyQ21kbVZ6bDJNRWxaTmxSNGNTOTVUbXhHU2pRclNEaHpVek55TURrM1NVeEdTbGhESzNSdFYyZG5hbk5MUTJ4M1VtZzVabEZITWtnd1NtNXdiVmQ0YlZNS2JHaEpjRkZ6VlVKbFYybExUMUEyUkVwblpGRklVRlIzV0hWVVNuVklWRU0zVTJOVVNWcFlaM2x2WW1oeFJYWnpaM0pJUXpObFlqQnZNbGhFUlcweFF3cFpUVGQ2TVZGVFFXOU9aWFZDZVdJd1MyNW5jRmRFYTBZMVlUQnBOMlp3YW05bVozVTVjMlkyZGxSek1XNVhNVGhCY2tjM1lXbzVaMlV3V21SeFMwUkRDbWxrUTBKR1p6VkZjV2xTVVZkb1UxUTVia0YwV1UxWVRHUnNka0pEZUhjMVREQmpjSFkyZEdwTmRVSjRlbGxFU1hwbFYweEdVa0UxUzFkdVNYTklNV29LUzFWclBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly83Rjk0QkYzRjVBQ0IwNUJGNTAyNEZBNkY0QzZBRjEzNi5ncjcuYXAtc291dGhlYXN0LTIuZWtzLmFtYXpvbmF3cy5jb20KSzhTX0NMVVNURVJfRE5TX0lQPTEwLjEwMC4wLjEwCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCBjcmFpZy1la3MgLS1rdWJlbGV0LWV4dHJhLWFyZ3MgJy0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsYWxwaGEuZWtzY3RsLmlvL2NsdXN0ZXItbmFtZT1jcmFpZy1la3MsYWxwaGEuZWtzY3RsLmlvL25vZGVncm91cC1uYW1lPXN0YW5kYXJkLXdvcmtlcnMsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wYjMzNDYzNGE2ZmFiY2M0YSxla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1zdGFuZGFyZC13b3JrZXJzLGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMDQ4YjBmNjEzOWY4NGRhMzIgLS1tYXgtcG9kcz0xNycgLS1iNjQtY2x1c3Rlci1jYSAkQjY0X0NMVVNURVJfQ0EgLS1hcGlzZXJ2ZXItZW5kcG9pbnQgJEFQSV9TRVJWRVJfVVJMIC0tZG5zLWNsdXN0ZXItaXAgJEs4U19DTFVTVEVSX0ROU19JUCAtLXVzZS1tYXgtcG9kcyBmYWxzZQoKLS0vLy0t"
    iam_instance_profile = "eks-dcc40c79-e265-93be-8fea-c4659b8a140c"
}

resource "aws_instance" "EC2Instance3" {
    ami = "ami-0b334634a6fabcc4a"
    instance_type = "t3.medium"
    availability_zone = "ap-southeast-2c"
    tenancy = "default"
    subnet_id = "subnet-0d48b149391be9a13"
    ebs_optimized = false
    vpc_security_group_ids = [
        "sg-0c8edf1a6ab4431e7",
        "sg-0c8edf1a6ab4431e7"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 80
        volume_type = "gp3"
        delete_on_termination = true
    }
    user_data = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVWWGhPUkVFeFRWUnJlVTVXYjFoRVZFMTZUVVJWZUUxVVFURk5WR3Q1VGxadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJTeTl1Q25CbmVrMURiV3haVDFndlp6RkRWamMxVUV0dlJqaEJUMWQ1Y3pkNU5rUTVlbGhaYzFZMlJtWnVaRWx1Vm5GVVdqVnhNR0pzV0VSSmEyUTFPRVpRTVhRS05GZHRSbkJRVmpaUU5TOXJhMWMxVG5GaE9UUnphV0Z4V1dKSWRWSmxhVkpxVURVdk1sQlFkMk54YlVWdGRHRnNORGh4WVdwUFoxcFJTMHBJWjA1NlpncEVXV2xCV1hoM1R6aHJhMmRNYmtkdVFYVkljRnBVUWpCWGN6UkNSekUzU0hORFVrRm9iazVLTjJOYVRUTnFVbWczVW14eE0yVnNjRGQzZEROelRsTnRDa3RaTlZSYVZGSXdTVk4yT0dkS1pFcFVZMk4zVGpsUVExZExXRE5aVjNKb1NqRXdZakEwUVZkU1lYVkhkbkpPVkZNeE9FTkJPRWRWYW5oamRHZFNXbFVLYVdSR01VY3ZSMlZFYXl0U1F6SkJkVnBZWlN0dGFWTlZhRWh1Y0U5WWJXZHRNR3B1VkdSc1FqQnZlV0ZWTDFrMFdIcFJURXB4Tnl0WE5GRnZhRTluT1FwdldGcG1PV2M1V2pORE4wVTBOVlpSZW5KTlEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaTUsyNXBXVXB1ZWxoNFVVRmhSVkp2TlZoeFZrVkljekp0ZEdwTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJTV2h6WjB3ME5WZHVaalpTVjBaUk9UaEpjQXA2YUZOd1RGWk1hbFpETlhWbE9HdHpaVmhoZWpaVE5sZzRjM2RSYXpoQmJYUm9NRmhoTlhVeVFsZFdRaXRoUlRBME5WcHNXQ3RsZW05U1NWQkdaM1ZyQ21kbVZ6bDJNRWxaTmxSNGNTOTVUbXhHU2pRclNEaHpVek55TURrM1NVeEdTbGhESzNSdFYyZG5hbk5MUTJ4M1VtZzVabEZITWtnd1NtNXdiVmQ0YlZNS2JHaEpjRkZ6VlVKbFYybExUMUEyUkVwblpGRklVRlIzV0hWVVNuVklWRU0zVTJOVVNWcFlaM2x2WW1oeFJYWnpaM0pJUXpObFlqQnZNbGhFUlcweFF3cFpUVGQ2TVZGVFFXOU9aWFZDZVdJd1MyNW5jRmRFYTBZMVlUQnBOMlp3YW05bVozVTVjMlkyZGxSek1XNVhNVGhCY2tjM1lXbzVaMlV3V21SeFMwUkRDbWxrUTBKR1p6VkZjV2xTVVZkb1UxUTVia0YwV1UxWVRHUnNka0pEZUhjMVREQmpjSFkyZEdwTmRVSjRlbGxFU1hwbFYweEdVa0UxUzFkdVNYTklNV29LUzFWclBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly83Rjk0QkYzRjVBQ0IwNUJGNTAyNEZBNkY0QzZBRjEzNi5ncjcuYXAtc291dGhlYXN0LTIuZWtzLmFtYXpvbmF3cy5jb20KSzhTX0NMVVNURVJfRE5TX0lQPTEwLjEwMC4wLjEwCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCBjcmFpZy1la3MgLS1rdWJlbGV0LWV4dHJhLWFyZ3MgJy0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsYWxwaGEuZWtzY3RsLmlvL2NsdXN0ZXItbmFtZT1jcmFpZy1la3MsYWxwaGEuZWtzY3RsLmlvL25vZGVncm91cC1uYW1lPXN0YW5kYXJkLXdvcmtlcnMsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wYjMzNDYzNGE2ZmFiY2M0YSxla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1zdGFuZGFyZC13b3JrZXJzLGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMDQ4YjBmNjEzOWY4NGRhMzIgLS1tYXgtcG9kcz0xNycgLS1iNjQtY2x1c3Rlci1jYSAkQjY0X0NMVVNURVJfQ0EgLS1hcGlzZXJ2ZXItZW5kcG9pbnQgJEFQSV9TRVJWRVJfVVJMIC0tZG5zLWNsdXN0ZXItaXAgJEs4U19DTFVTVEVSX0ROU19JUCAtLXVzZS1tYXgtcG9kcyBmYWxzZQoKLS0vLy0t"
    iam_instance_profile = "eks-dcc40c79-e265-93be-8fea-c4659b8a140c"
    tags = {
        alpha.eksctl.io/nodegroup-type = "managed"
        alpha.eksctl.io/nodegroup-name = "standard-workers"
        k8s.io/cluster-autoscaler/enabled = "true"
        k8s.io/cluster-autoscaler/craig-eks = "owned"
        kubernetes.io/cluster/craig-eks = "owned"
        eks:cluster-name = "craig-eks"
        eks:nodegroup-name = "standard-workers"
        Name = "craig-eks-standard-workers-Node"
    }
}

resource "aws_ecr_repository" "ECRRepository" {
    name = "vuln-node"
}

resource "aws_eks_cluster" "EKSCluster" {
    name = "craig-eks"
    role_arn = "arn:aws:iam::730606171750:role/eksctl-craig-eks-cluster-ServiceRole-1RB8ZVCN1RS0L"
    version = "1.25"
    vpc_config {
        security_group_ids = [
            "sg-0efa165528cfa2b91"
        ]
        subnet_ids = [
            "subnet-005efa804d7c15667",
            "subnet-06c64e00c77bc38e0",
            "subnet-09883a3444e25c8b5",
            "subnet-02bebf959e12963a5",
            "subnet-0d48b149391be9a13",
            "subnet-082449d215e151f66"
        ]
    }
}

resource "aws_s3_bucket" "S3Bucket" {
    bucket = "mongodb-backups-tech-exercise"
}

resource "aws_vpc" "EC2VPC" {
    cidr_block = "192.168.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        eksctl.cluster.k8s.io/v1alpha1/cluster-name = "craig-eks"
        alpha.eksctl.io/eksctl-version = "0.139.0"
        alpha.eksctl.io/cluster-name = "craig-eks"
        alpha.eksctl.io/cluster-oidc-enabled = "false"
        Name = "eksctl-craig-eks-cluster/VPC"
    }
}

resource "aws_vpc" "EC2VPC2" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        Name = "TechExercise-vpc"
    }
}

resource "aws_subnet" "EC2Subnet" {
    availability_zone = "ap-southeast-2a"
    cidr_block = "10.0.0.0/20"
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet2" {
    availability_zone = "ap-southeast-2b"
    cidr_block = "10.0.144.0/20"
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet3" {
    availability_zone = "ap-southeast-2c"
    cidr_block = "192.168.160.0/19"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet4" {
    availability_zone = "ap-southeast-2a"
    cidr_block = "192.168.96.0/19"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet5" {
    availability_zone = "ap-southeast-2b"
    cidr_block = "10.0.16.0/20"
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet6" {
    availability_zone = "ap-southeast-2b"
    cidr_block = "192.168.32.0/19"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "EC2Subnet7" {
    availability_zone = "ap-southeast-2c"
    cidr_block = "192.168.64.0/19"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "EC2Subnet8" {
    availability_zone = "ap-southeast-2a"
    cidr_block = "10.0.128.0/20"
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet9" {
    availability_zone = "ap-southeast-2b"
    cidr_block = "192.168.128.0/19"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet10" {
    availability_zone = "ap-southeast-2a"
    cidr_block = "192.168.0.0/19"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "EC2InternetGateway" {
    tags = {
        Name = "TechExercise-igw"
    }
    vpc_id = "${aws_vpc.EC2VPC2.id}"
}

resource "aws_internet_gateway" "EC2InternetGateway2" {
    tags = {
        alpha.eksctl.io/cluster-oidc-enabled = "false"
        Name = "eksctl-craig-eks-cluster/InternetGateway"
        alpha.eksctl.io/eksctl-version = "0.139.0"
        eksctl.cluster.k8s.io/v1alpha1/cluster-name = "craig-eks"
        alpha.eksctl.io/cluster-name = "craig-eks"
    }
    vpc_id = "${aws_vpc.EC2VPC.id}"
}

resource "aws_eip" "EC2EIP" {
    vpc = true
}

resource "aws_eip" "EC2EIP2" {
    vpc = true
}

resource "aws_eip_association" "EC2EIPAssociation" {
    allocation_id = "eipalloc-02f9799723a217072"
    network_interface_id = "eni-009a7e9847f11c68a"
    private_ip_address = "192.168.22.77"
}

resource "aws_eip" "EC2EIP3" {
    vpc = true
}

resource "aws_eip" "EC2EIP4" {
    vpc = true
}

resource "aws_eip" "EC2EIP5" {
    vpc = true
}

resource "aws_route_table" "EC2RouteTable" {
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    tags = {
        Name = "TechExercise-rtb-private2-ap-southeast-2b"
    }
}

resource "aws_route_table" "EC2RouteTable2" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {}
}

resource "aws_route_table" "EC2RouteTable3" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {
        alpha.eksctl.io/cluster-name = "craig-eks"
        alpha.eksctl.io/eksctl-version = "0.139.0"
        eksctl.cluster.k8s.io/v1alpha1/cluster-name = "craig-eks"
        alpha.eksctl.io/cluster-oidc-enabled = "false"
        Name = "eksctl-craig-eks-cluster/PrivateRouteTableAPSOUTHEAST2A"
    }
}

resource "aws_route_table" "EC2RouteTable4" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {
        eksctl.cluster.k8s.io/v1alpha1/cluster-name = "craig-eks"
        alpha.eksctl.io/cluster-name = "craig-eks"
        alpha.eksctl.io/eksctl-version = "0.139.0"
        alpha.eksctl.io/cluster-oidc-enabled = "false"
        Name = "eksctl-craig-eks-cluster/PrivateRouteTableAPSOUTHEAST2B"
    }
}

resource "aws_route_table" "EC2RouteTable5" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {
        alpha.eksctl.io/cluster-oidc-enabled = "false"
        Name = "eksctl-craig-eks-cluster/PublicRouteTable"
        alpha.eksctl.io/cluster-name = "craig-eks"
        eksctl.cluster.k8s.io/v1alpha1/cluster-name = "craig-eks"
        alpha.eksctl.io/eksctl-version = "0.139.0"
    }
}

resource "aws_route_table" "EC2RouteTable6" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {
        alpha.eksctl.io/cluster-oidc-enabled = "false"
        alpha.eksctl.io/cluster-name = "craig-eks"
        eksctl.cluster.k8s.io/v1alpha1/cluster-name = "craig-eks"
        Name = "eksctl-craig-eks-cluster/PrivateRouteTableAPSOUTHEAST2C"
        alpha.eksctl.io/eksctl-version = "0.139.0"
    }
}

resource "aws_route_table" "EC2RouteTable7" {
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    tags = {
        Name = "TechExercise-rtb-public"
    }
}

resource "aws_route_table" "EC2RouteTable8" {
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    tags = {
        Name = "TechExercise-rtb-private1-ap-southeast-2a"
    }
}

resource "aws_route_table" "EC2RouteTable9" {
    vpc_id = "${aws_vpc.EC2VPC2.id}"
    tags = {}
}

resource "aws_route" "EC2Route" {
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "nat-061779916cb1e8d61"
    route_table_id = "rtb-0952bb1be85cc0116"
}

resource "aws_route" "EC2Route2" {
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "nat-0cd62bbccd7d01ff4"
    route_table_id = "rtb-0d88a79a9cc2a6014"
}

resource "aws_route" "EC2Route3" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "igw-099d5da8a792abb3e"
    route_table_id = "rtb-0d37fe41a03b44a98"
}

resource "aws_route" "EC2Route4" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "igw-049c27cc07b140cbe"
    route_table_id = "rtb-0eb039a359517bb6b"
}

resource "aws_route" "EC2Route5" {
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "nat-0b695226252a0f15c"
    route_table_id = "rtb-06d2eb54a7b43289c"
}

resource "aws_nat_gateway" "EC2NatGateway" {
    subnet_id = "subnet-005efa804d7c15667"
    tags = {
        alpha.eksctl.io/cluster-name = "craig-eks"
        eksctl.cluster.k8s.io/v1alpha1/cluster-name = "craig-eks"
        alpha.eksctl.io/cluster-oidc-enabled = "false"
        alpha.eksctl.io/eksctl-version = "0.139.0"
        Name = "eksctl-craig-eks-cluster/NATGateway"
    }
    allocation_id = "eipalloc-02f9799723a217072"
}
