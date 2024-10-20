resource "aws_security_group" "security_group" {
  name        = "security_group"
  description = "firewall rules"
  vpc_id      = aws_vpc.vpc.id
}

# GENERAL

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.security_group.id
  description       = "all outbound"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}


resource "aws_vpc_security_group_ingress_rule" "ssh_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "SSH Inbound from my IP"
  from_port         = 22
 cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
 to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "HTTPs Inbound from my IP"
  from_port         = 443
 cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
 to_port           = 443
  ip_protocol       = "tcp"
}

ingress {
    from_port   = 1514
    to_port     = 1514
    protocol    = "udp"
    cidr_blocks = [var.my_ip]  # Replace with your actual IP or secret value
  }

  ingress {
    from_port   = 1515
    to_port     = 1515
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 55000
    to_port     = 55000
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 55000
    to_port     = 55000
    protocol    = "udp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 9300
    to_port     = 9300
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }


resource "aws_vpc_security_group_ingress_rule" "internal" {
  security_group_id = aws_security_group.security_group.id
  description       = "Internal communication between hosts"
  cidr_ipv4         = aws_subnet.subnet.cidr_block
  ip_protocol       = -1
}



