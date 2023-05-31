resource "aws_security_group" "try6_stack_sg" {
  vpc_id      = aws_vpc.try6.id
  name        = "try6-stack-sg"
  description = "Sec Grp for try6 ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}