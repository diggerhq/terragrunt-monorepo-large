include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/network/route-table-864",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/compute/eks-843",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/fsx-552",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/storage/redshift-76",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/cache-layer-942",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-573?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-573"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}