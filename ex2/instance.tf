resource "aws_instance" "try2" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.TYPE
  availability_zone      = var.ZONE1
  key_name               = var.KEY
  vpc_security_group_ids = var.SGID
  tags                   = var.TAGS
}

output "publicIP" {
  value = aws_instance.try4.public_ip
}

output "privateIP" {
  value = aws_instance.try4.private_ip
}