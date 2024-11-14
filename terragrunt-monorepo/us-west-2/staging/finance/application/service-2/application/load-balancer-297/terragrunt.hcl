include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/security/kms-757",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/monitoring/log-aggregation-577",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/security/security-hub-274",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/compute/fargate-566",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/security/kms-334",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-297?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-297"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}