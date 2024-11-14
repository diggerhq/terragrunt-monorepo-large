include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/application/cache-layer-217",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/security/security-hub-428",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/security/certificates-348",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/compute/ec2-297",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-836?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-836"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}