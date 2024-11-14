include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/compute/batch-624",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/monitoring/grafana-784",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/monitoring/cloudwatch-801",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-866?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-866"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}