include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/compute/fargate-608",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/monitoring/cloudwatch-387",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-552",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/service-mesh-548",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/security/kms-874",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-141?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-141"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}