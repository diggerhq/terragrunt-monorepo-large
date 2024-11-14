include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-3/storage/efs-163",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/event-bus-334",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/application/api-gateway-297",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/monitoring/grafana-529",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-294?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-294"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}