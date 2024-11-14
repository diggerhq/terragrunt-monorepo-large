include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/compute/ec2-783",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/monitoring/prometheus-808",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/security/secrets-966",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/alertmanager-345",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/monitoring/log-aggregation-190",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-349?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-349"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}