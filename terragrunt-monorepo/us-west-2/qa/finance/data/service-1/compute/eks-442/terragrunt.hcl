include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/storage/efs-795",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/storage/backup-176",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/security/secrets-785",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/network/vpn-120",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-442?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-442"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}