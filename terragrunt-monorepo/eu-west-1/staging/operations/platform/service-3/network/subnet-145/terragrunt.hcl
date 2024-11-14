include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/security/guardduty-714",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/security/iam-625",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/monitoring/log-aggregation-10",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/application/load-balancer-164",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/application/queue-823",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-145?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-145"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}