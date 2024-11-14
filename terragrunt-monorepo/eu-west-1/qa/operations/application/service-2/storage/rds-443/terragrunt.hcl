include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/compute/ec2-452",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/security/certificates-330",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/spot-fleet-425",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/security/security-hub-343",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-443?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-443"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}