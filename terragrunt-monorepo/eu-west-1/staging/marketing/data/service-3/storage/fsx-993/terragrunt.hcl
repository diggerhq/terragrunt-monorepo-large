include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/grafana-800",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/network/nacl-260",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/security/iam-663",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/dynamodb-265",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-993?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-993"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}