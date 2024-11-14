include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/storage/efs-961",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/storage/redshift-65",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/guardduty-683",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/network/direct-connect-459",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/monitoring/alertmanager-732",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-22?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-22"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}