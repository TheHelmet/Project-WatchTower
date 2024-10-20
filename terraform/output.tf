output "main_server_ips" {
  value = { for i, inst in aws_instance.overwatch : inst.tags.Name => inst.public_ip }
  description = "The public IP addresses of the servers"
}
