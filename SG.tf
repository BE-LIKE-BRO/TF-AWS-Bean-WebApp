resource "aws_security_group" "beanstalk-ELB-SG" {
  name        = "beanstalk-ELB-SG"
  description = "Security group for elastic beanstalk-LB"
  vpc_id      = module.vpc.vpc_id
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
}

resource "aws_security_group" "Bastion-SG" {
  name        = "Bastion-SG"
  description = "Security group for Bastion host"
  vpc_id      = module.vpc.vpc_id
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = [var.MYIP]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
}

resource "aws_security_group" "Prod-SG" {
  name        = "Prod-SG"
  description = "Security group for elastic beanstalk ec2 instance"
  vpc_id      = module.vpc.vpc_id
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = [aws_security_group.Bastion-SG.id]

  }
}

resource "aws_security_group" "Backend-SG" {
  name        = "Backend-SG"
  description = "Security group for backend services; RDS, active-mq, elastic-cache"
  vpc_id      = module.vpc.vpc_id
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [aws_security_group.Prod-SG.id]

  }
}

resource "aws_security_group_rule" "name" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.Backend-SG.id
  source_security_group_id = aws_security_group.Backend-SG.id

}