include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/network/vpn-548",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/security/waf-116",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/storage/redshift-897",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/event-bus-483",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/log-aggregation-295",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-453?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-453"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}