include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-1/monitoring/prometheus-487",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/compute/eks-623",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/storage/elasticache-64",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/security/iam-368",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-78?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-78"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}