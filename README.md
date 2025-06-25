Fullstack Monitoring

Projeto de monitoramento contínuo com Infraestrutura como Código (IaC) utilizando Terraform, Ansible, Prometheus, Grafana, Node Exporter, cAdvisor e uma aplicação Flask para testes.

⸻

Descrição

Este projeto demonstra uma solução completa de observabilidade para ambientes em nuvem, com provisionamento automático da infraestrutura e configuração dos serviços de monitoramento. O foco é monitorar recursos da instância EC2, containers Docker e uma aplicação web simples em Flask, com métricas expostas ao Prometheus e visualizadas no Grafana.

⸻

Tecnologias Utilizadas
	•	Terraform: Provisionamento da infraestrutura (EC2, VPC, Security Groups).
	•	Ansible: Configuração automática dos serviços e deploy da aplicação.
	•	Prometheus: Coleta de métricas.
	•	Grafana: Visualização dos dados e dashboards.
	•	Node Exporter: Métricas do host.
	•	cAdvisor: Métricas de containers.
	•	Flask: Aplicação de teste para métricas customizadas.