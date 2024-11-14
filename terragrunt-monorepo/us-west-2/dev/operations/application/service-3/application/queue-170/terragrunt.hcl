include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/network/vpc-214",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/network/subnet-210",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/security/security-hub-909",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/storage/fsx-571",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/storage/efs-702",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-170?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-170"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}