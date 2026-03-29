output "server_ip" {
  description = "IP address of server"
  value = module.ec2.public_ip
}