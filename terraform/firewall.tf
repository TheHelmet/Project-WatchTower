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

resource "aws_vpc_security_group_ingress_rule" "wazuh_syslog_udp_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "Wazuh Syslog Inbound (UDP 1514) from my IP"
  from_port         = 1514
  cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
  to_port           = 1514
  ip_protocol       = "udp"
}

resource "aws_vpc_security_group_ingress_rule" "wazuh_protocol_tcp_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "Wazuh Protocol Inbound (TCP 1515) from my IP"
  from_port         = 1515
  cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
  to_port           = 1515
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "wazuh_api_tcp_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "Wazuh API Inbound (TCP 55000) from my IP"
  from_port         = 55000
  cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
  to_port           = 55000
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "wazuh_api_udp_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "Wazuh API Inbound (UDP 55000) from my IP"
  from_port         = 55000
  cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
  to_port           = 55000
  ip_protocol       = "udp"
}

resource "aws_vpc_security_group_ingress_rule" "elasticsearch_tcp_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "Elasticsearch Inbound (TCP 9200) from my IP"
  from_port         = 9200
  cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
  to_port           = 9200
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "elasticsearch_cluster_tcp_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "Elasticsearch Cluster Inbound (TCP 9300) from my IP"
  from_port         = 9300
  cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
  to_port           = 9300
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "kibana_tcp_inbound_my_ip" {
  security_group_id = aws_security_group.security_group.id
  description       = "Kibana Inbound (TCP 5601) from my IP"
  from_port         = 5601
  cidr_ipv4         = "${coalesce(var.my_ip, "192.168.0.1")}/32"
  to_port           = 5601
  ip_protocol       = "tcp"
}


resource "aws_vpc_security_group_ingress_rule" "internal" {
  security_group_id = aws_security_group.security_group.id
  description       = "Internal communication between hosts"
  cidr_ipv4         = aws_subnet.subnet.cidr_block
  ip_protocol       = -1
}



