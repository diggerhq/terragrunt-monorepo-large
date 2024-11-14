include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-2/storage/efs-60",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/ec2-400",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/security/shield-292",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/security/guardduty-3",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-386?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-386"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}