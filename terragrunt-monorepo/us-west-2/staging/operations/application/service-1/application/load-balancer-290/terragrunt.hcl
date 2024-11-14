include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/security/guardduty-758",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/storage/efs-728",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/security/secrets-127",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/application/load-balancer-98",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/ec2-214",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-290?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-290"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}