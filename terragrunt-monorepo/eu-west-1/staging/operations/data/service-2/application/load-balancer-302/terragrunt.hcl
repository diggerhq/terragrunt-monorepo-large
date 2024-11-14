include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/security/waf-752",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/batch-533",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/storage/fsx-747",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-302?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-302"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}