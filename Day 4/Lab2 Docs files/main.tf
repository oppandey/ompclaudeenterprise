# Sample Terraform - intentionally contains issues for audit exercise
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "invoice_uploads" {
  bucket = "s3-invoice-uploads-sample"
  acl    = "public-read"
}

resource "aws_s3_bucket" "app_logs" {
  bucket = "s3-app-logs-sample"
}

resource "aws_security_group" "web_sg" {
  name        = "sg-web-01"
  description = "Web tier security group"
  vpc_id      = "vpc-0sample001"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "sg-bastion-01"
  description = "Bastion security group"
  vpc_id      = "vpc-0sample001"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "orders" {
  identifier          = "rds-orders-01"
  engine              = "postgres"
  engine_version      = "15.4"
  instance_class      = "db.t3.medium"
  allocated_storage   = 50
  username            = "dbadmin"
  password            = "REPLACE_ME_SAMPLE"
  publicly_accessible = true
  storage_encrypted   = false
  skip_final_snapshot = true
}
