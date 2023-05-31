resource "aws_key_pair" "terraform-key" {
  key_name   = "intern-test2"
  public_key = file("terraform1.pub")

}

resource "aws_instance" "try4" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.TYPE
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = var.SGID
  tags                   = var.TAGS

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web/sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terraform1")
    host        = self.public_ip
  }

}

output "publicIP" {
  value = aws_instance.try4.public_ip
}

output "privateIP" {
  value = aws_instance.try4.private_ip
}