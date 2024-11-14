include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/compute/eks-350",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/storage/elasticache-359",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/storage/redshift-318",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/alertmanager-768",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/storage/elasticache-976",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-5?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-5"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}