include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/security/guardduty-652",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/compute/fargate-890",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/application/load-balancer-862",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/alertmanager-756",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-731?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-731"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}