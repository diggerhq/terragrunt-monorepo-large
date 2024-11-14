include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-1/application/event-bus-882",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/compute/auto-scaling-123",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/compute/ec2-521",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/monitoring/alertmanager-65",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/monitoring/grafana-588",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-457?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-457"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}