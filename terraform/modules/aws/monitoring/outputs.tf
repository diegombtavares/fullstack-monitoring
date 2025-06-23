output "monitoring_eip_address" {
  value = aws_eip.monitoring_eip.public_ip
}

output "application_eip_address" {
  value = aws_eip.application_eip.public_ip
}