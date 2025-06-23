# Security Group
resource "aws_security_group" "monitoring_sg" {
  name        = "monitoring-sg"
  description = "Allow SSH, HTTP and custom port access"

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "monitoring-security-group"
    Environment = "Monitoring"
  }
}

# Instância para Prometheus/Grafana
resource "aws_instance" "monitoring_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  tags = {
    Name        = "monitoring-instance"
    Role        = "Prometheus/Grafana"
    Environment = "Monitoring"
  }
}

# Instância para a aplicação Flask
resource "aws_instance" "application_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  tags = {
    Name        = "application-instance"
    Role        = "Flask App"
    Environment = "Application"
  }
}

# EIP para a instância de monitoramento (Prometheus/Grafana)
resource "aws_eip" "monitoring_eip" {
  instance = aws_instance.monitoring_instance.id

  tags = {
    Name = "monitoring-eip"
  }
}

# EIP para a instância da aplicação Flask
resource "aws_eip" "application_eip" {
  instance = aws_instance.application_instance.id

  tags = {
    Name = "application-eip"
  }
}

resource "local_file" "ansible_inventory" {
  content = <<-EOT
    [monitoring]
    ${aws_eip.monitoring_eip.public_ip} ansible_user=ubuntu

    [application]
    ${aws_eip.application_eip.public_ip} ansible_user=ubuntu
  EOT
  filename = "../ansible/inventory/hosts"
}