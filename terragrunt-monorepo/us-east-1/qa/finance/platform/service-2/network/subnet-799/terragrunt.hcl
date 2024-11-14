include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/secrets-48",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/network/subnet-768",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/compute/batch-374",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/compute/auto-scaling-334",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-799?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-799"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}