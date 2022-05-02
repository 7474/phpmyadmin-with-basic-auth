# Ref. https://github.com/terraform-aws-modules/terraform-aws-rds-aurora/blob/v7.0.0/examples/serverless/main.tf
data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = "10.99.0.0/18"

  azs              = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]

  enable_nat_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "aurora" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name           = "${var.name}-aurora"
  engine         = "aurora-mysql"
  engine_mode    = "provisioned"
  engine_version = "8.0.mysql_aurora.3.02.0"
  instance_class = "db.serverless"
  instances = {
    sv2 = {
      publicly_accessible = true
    }
  }

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets

  create_security_group = true
  # public access
  allowed_cidr_blocks = ["0.0.0.0/0"]

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  serverlessv2_scaling_configuration = {
    min_capacity = 0.5
    max_capacity = 0.5
  }
}