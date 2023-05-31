resource "aws_key_pair" "try6-key" {
  key_name   = "terraform1"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "try6-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.try6-pub-1.id
  key_name               = aws_key_pair.try6-key.key_name
  vpc_security_group_ids = [aws_security_group.try6_stack_sg.id]
  tags = {
    Name = "my-try6"
  }
}

resource "aws_ebs_volume" "vol_4_try6" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-try6"
  }
}

resource "aws_volume_attachment" "atch_vol_try6" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_try6.id
  instance_id = aws_instance.try6-web.id
}

output "PublicIP" {
  value = aws_instance.try6-web.public_ip
}