include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/service-mesh-281",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/monitoring/log-aggregation-251",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/fargate-814",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/network/vpc-213",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-835?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-835"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}