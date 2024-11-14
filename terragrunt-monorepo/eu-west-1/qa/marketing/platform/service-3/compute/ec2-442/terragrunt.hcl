include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/storage/fsx-669",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/network/vpn-283",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/security/secrets-746",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/ec2-973",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-442?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-442"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}