include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/storage/efs-945",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/compute/spot-fleet-827",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/compute/eks-861",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/storage/fsx-407",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-132?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-132"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}