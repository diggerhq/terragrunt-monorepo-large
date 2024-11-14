include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/alertmanager-417",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-509",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/security/guardduty-543",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/monitoring/cloudwatch-258",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-437?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-437"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}