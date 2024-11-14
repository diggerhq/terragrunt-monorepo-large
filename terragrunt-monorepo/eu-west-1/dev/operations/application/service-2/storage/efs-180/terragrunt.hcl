include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/compute/eks-385",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/application/cache-layer-107",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/storage/redshift-646",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/monitoring/alertmanager-224",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/trace-collection-865",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-180?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-180"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}