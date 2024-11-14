include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/compute/eks-78",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/grafana-707",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/storage/efs-657",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/monitoring/alertmanager-945",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-16?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-16"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}