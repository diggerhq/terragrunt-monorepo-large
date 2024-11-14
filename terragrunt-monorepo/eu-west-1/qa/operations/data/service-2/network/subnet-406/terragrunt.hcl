include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/security/certificates-554",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/storage/elasticache-801",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/auto-scaling-496",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/compute/ecs-104",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-406?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-406"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}