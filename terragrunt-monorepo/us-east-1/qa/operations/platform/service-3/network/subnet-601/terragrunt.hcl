include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/network/route-table-435",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/network/nacl-646",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/security/shield-157",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/network/vpc-901",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/compute/eks-404",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-601?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-601"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}