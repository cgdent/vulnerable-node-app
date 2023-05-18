resource "aws_vpc" "eksctl-craig-eks-cluster-VPC" {
    cidr_block           = "192.168.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "aws:cloudformation:logical-id" = "VPC"
        "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "craig-eks"
        "alpha.eksctl.io/eksctl-version" = "0.139.0"
        "alpha.eksctl.io/cluster-name" = "craig-eks"
        "alpha.eksctl.io/cluster-oidc-enabled" = "false"
        "aws:cloudformation:stack-id" = "arn:aws:cloudformation:ap-southeast-2:730606171750:stack/eksctl-craig-eks-cluster/18ec6020-f216-11ed-89c9-0a2662377850"
        "aws:cloudformation:stack-name" = "eksctl-craig-eks-cluster"
        "Name" = "eksctl-craig-eks-cluster/VPC"
    }
}

resource "aws_vpc" "TechExercise-vpc" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "TechExercise-vpc"
    }
}

resource "aws_internet_gateway" "TechExercise-igw" {
    vpc_id = "vpc-0c5a0bb514cd43c5d"

    tags {
        "Name" = "TechExercise-igw"
    }
}

resource "aws_internet_gateway" "eksctl-craig-eks-cluster-InternetGateway" {
    vpc_id = "vpc-0e30e80d171075db8"

    tags {
        "alpha.eksctl.io/cluster-oidc-enabled" = "false"
        "Name" = "eksctl-craig-eks-cluster/InternetGateway"
        "aws:cloudformation:stack-name" = "eksctl-craig-eks-cluster"
        "alpha.eksctl.io/eksctl-version" = "0.139.0"
        "aws:cloudformation:stack-id" = "arn:aws:cloudformation:ap-southeast-2:730606171750:stack/eksctl-craig-eks-cluster/18ec6020-f216-11ed-89c9-0a2662377850"
        "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "craig-eks"
        "aws:cloudformation:logical-id" = "InternetGateway"
        "alpha.eksctl.io/cluster-name" = "craig-eks"
    }
}

resource "aws_elb" "aac7647d661b247d7a0de72b9c35655b" {
    name                        = "aac7647d661b247d7a0de72b9c35655b"
    subnets                     = ["subnet-005efa804d7c15667", "subnet-06c64e00c77bc38e0", "subnet-09883a3444e25c8b5"]
    security_groups             = ["sg-0c32ba21fd790aeab"]
    instances                   = ["i-09bdb7e3a6842695b", "i-08ce4b20e693558b0"]
    cross_zone_load_balancing   = false
    idle_timeout                = 60
    connection_draining         = false
    connection_draining_timeout = 300
    internal                    = false

    listener {
        instance_port      = 31841
        instance_protocol  = "tcp"
        lb_port            = 4000
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 6
        interval            = 10
        target              = "TCP:31841"
        timeout             = 5
    }

    tags {
        "kubernetes.io/service-name" = "vuln-node/goofservice"
        "kubernetes.io/cluster/craig-eks" = "owned"
    }
}

resource "aws_instance" "MyMongoDBServer" {
    ami                         = "ami-072276e586375df1d"
    availability_zone           = "ap-southeast-2a"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "My APJ SE Sydney Key Pair"
    subnet_id                   = "subnet-01a44f8b6249180b3"
    vpc_security_group_ids      = ["sg-002ec7c65880d96c1"]
    associate_public_ip_address = true
    private_ip                  = "10.0.11.133"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        delete_on_termination = true
    }

    tags {
        "Name" = "MyMongoDBServer"
    }
}

resource "aws_instance" "craig-eks-standard-workers-Node" {
    ami                         = "ami-0b334634a6fabcc4a"
    availability_zone           = "ap-southeast-2a"
    ebs_optimized               = false
    instance_type               = "t3.medium"
    monitoring                  = false
    key_name                    = ""
    subnet_id                   = "subnet-082449d215e151f66"
    vpc_security_group_ids      = ["sg-0c8edf1a6ab4431e7"]
    associate_public_ip_address = false
    private_ip                  = "192.168.106.214"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp3"
        volume_size           = 80
        delete_on_termination = true
    }

    tags {
        "alpha.eksctl.io/nodegroup-type" = "managed"
        "aws:ec2launchtemplate:id" = "lt-0ae0ed7150b2207e7"
        "k8s.io/cluster-autoscaler/craig-eks" = "owned"
        "aws:eks:cluster-name" = "craig-eks"
        "k8s.io/cluster-autoscaler/enabled" = "true"
        "aws:ec2launchtemplate:version" = "1"
        "alpha.eksctl.io/nodegroup-name" = "standard-workers"
        "Name" = "craig-eks-standard-workers-Node"
        "kubernetes.io/cluster/craig-eks" = "owned"
        "aws:autoscaling:groupName" = "eks-standard-workers-dcc40c79-e265-93be-8fea-c4659b8a140c"
        "eks:cluster-name" = "craig-eks"
        "aws:ec2:fleet-id" = "fleet-291ec7b6-b686-4e2f-0e1a-0388ee5aca1e"
        "eks:nodegroup-name" = "standard-workers"
    }
}

resource "aws_instance" "craig-eks-standard-workers-Node" {
    ami                         = "ami-0b334634a6fabcc4a"
    availability_zone           = "ap-southeast-2c"
    ebs_optimized               = false
    instance_type               = "t3.medium"
    monitoring                  = false
    key_name                    = ""
    subnet_id                   = "subnet-0d48b149391be9a13"
    vpc_security_group_ids      = ["sg-0c8edf1a6ab4431e7"]
    associate_public_ip_address = false
    private_ip                  = "192.168.188.214"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp3"
        volume_size           = 80
        delete_on_termination = true
    }

    tags {
        "alpha.eksctl.io/nodegroup-type" = "managed"
        "aws:ec2launchtemplate:version" = "1"
        "alpha.eksctl.io/nodegroup-name" = "standard-workers"
        "k8s.io/cluster-autoscaler/enabled" = "true"
        "aws:eks:cluster-name" = "craig-eks"
        "k8s.io/cluster-autoscaler/craig-eks" = "owned"
        "kubernetes.io/cluster/craig-eks" = "owned"
        "eks:cluster-name" = "craig-eks"
        "eks:nodegroup-name" = "standard-workers"
        "Name" = "craig-eks-standard-workers-Node"
        "aws:ec2launchtemplate:id" = "lt-0ae0ed7150b2207e7"
        "aws:ec2:fleet-id" = "fleet-37a5fa8f-f937-e99e-ac1a-a688bb26b680"
        "aws:autoscaling:groupName" = "eks-standard-workers-dcc40c79-e265-93be-8fea-c4659b8a140c"
    }
}

resource "aws_s3_bucket" "mongodb-backups-tech-exercise" {
    bucket = "mongodb-backups-tech-exercise"
    acl    = "private"
}
