include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-1/security/waf-676",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/monitoring/prometheus-516",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/storage/elasticache-910",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/spot-fleet-678",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-56?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-56"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}