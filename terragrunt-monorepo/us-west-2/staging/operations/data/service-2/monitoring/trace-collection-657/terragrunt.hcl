include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/security/kms-381",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/eks-339",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/monitoring/grafana-603",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/storage/redshift-912",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/storage/efs-961",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-657?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-657"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}