include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/ecs-183",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/security/secrets-204",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/security/security-hub-714",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/security/certificates-271",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/network/transit-gateway-759",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-971?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-971"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}