output "public_ip" {
  value = data.aws_instances.web_instances.public_ips
  description = "The public IP address of the web server"
}