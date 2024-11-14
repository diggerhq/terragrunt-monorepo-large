include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/spot-fleet-400",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/application/load-balancer-494",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/storage/s3-461",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/security/waf-346",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-281?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-281"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}