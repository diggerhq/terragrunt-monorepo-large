include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/compute/eks-385",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/network/route-table-77",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/waf-545",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/storage/s3-742",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-502?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-502"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}