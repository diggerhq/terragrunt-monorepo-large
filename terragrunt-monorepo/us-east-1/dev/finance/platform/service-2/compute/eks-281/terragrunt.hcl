include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/security/kms-377",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/storage/fsx-203",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/storage/backup-942",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/monitoring/prometheus-620",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/compute/auto-scaling-615",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-281?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-281"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}