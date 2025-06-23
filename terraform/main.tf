provider "aws" {
  region = "us-east-1"
  profile = "monitoring"
}

module "monitoring_infrastructure" {
  source     = "./modules/aws/monitoring"
}