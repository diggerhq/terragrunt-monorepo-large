include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/compute/ec2-993",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/application/load-balancer-255",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/application/service-mesh-787",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/security/shield-456",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-287?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-287"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}