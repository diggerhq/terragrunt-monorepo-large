include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/application/api-gateway-953",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/monitoring/log-aggregation-653",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/prometheus-226",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-666?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-666"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}