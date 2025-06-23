output "monitoring_eip_address" {
  description = "Elastic IP da instância de monitoramento (Prometheus/Grafana)"
  value       = module.monitoring_infrastructure.monitoring_eip_address
}

output "application_eip_address" {
  description = "Elastic IP da instância da aplicação"
  value       = module.monitoring_infrastructure.application_eip_address
}