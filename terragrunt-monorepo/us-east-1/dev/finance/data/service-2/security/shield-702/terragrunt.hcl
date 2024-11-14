include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/network/nacl-361",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/application/cache-layer-935",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/security/iam-673",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/compute/ec2-90",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-702?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-702"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}