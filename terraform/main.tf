resource "aws_instance" "overwatch" {

  count                       = 1
  ami                         = "ami-001f2488b35ca8aad"
  instance_type               = "t2.large"
  key_name                    = var.key_pair
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet.id
  vpc_security_group_ids      = ["${aws_security_group.security_group.id}"]

  root_block_device {
    delete_on_termination = true
    volume_size           = "30"
  }

  tags = {
    "Name" = "Watchtower-${count.index + 1}"  # Unique name for each server
    "project" = var.project
  }

  user_data_base64 = base64encode(templatefile("cloudinit/userdata.tmpl", {
  }))
}
