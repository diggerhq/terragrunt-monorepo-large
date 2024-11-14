include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-3/security/shield-473",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/monitoring/log-aggregation-252",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/monitoring/alertmanager-679",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/security/waf-316",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/compute/eks-746",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-301?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-301"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}