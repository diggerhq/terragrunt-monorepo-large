include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/application/load-balancer-790",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/monitoring/grafana-184",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/security/kms-807",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/storage/efs-180",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/network/route-table-545",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-289?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-289"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}