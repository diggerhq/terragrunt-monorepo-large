include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/monitoring/grafana-645",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/security/certificates-948",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/application/api-gateway-172",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/application/load-balancer-445",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/application/event-bus-481",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-254?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-254"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}