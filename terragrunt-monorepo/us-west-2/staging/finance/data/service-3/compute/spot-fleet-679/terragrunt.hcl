include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/storage/efs-574",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/compute/fargate-56",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/storage/fsx-859",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/storage/fsx-624",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/network/direct-connect-663",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-679?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-679"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}